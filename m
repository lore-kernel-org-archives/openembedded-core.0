Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF5D73A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 16:34:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2015 09:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,459,1422950400"; d="scan'208";a="684913702"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.155])
	([10.219.4.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2015 09:34:07 -0700
Message-ID: <55119205.9040605@linux.intel.com>
Date: Tue, 24 Mar 2015 10:34:13 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>, 
	openembedded-core@lists.openembedded.org
References: <1427126707-38854-1-git-send-email-anibal.limon@linux.intel.com>
	<55115179.7050506@opendreambox.org>
In-Reply-To: <55115179.7050506@opendreambox.org>
Subject: Re: [PATCH] package_manager/deb: apt-ftparchive needs a valid config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Mar 2015 16:34:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andreas,

Your solution is better but i think we need to generalize the code in 
DpkgPM::_create_configs to avoid code duplicate.

Comments?

Cheers,
     alimon

On 24/03/15 05:58, Andreas Oberritter wrote:
> Hello Aníbal,
>
> On 23.03.2015 17:05, Aníbal Limón wrote:
>> Since we have support of log checking in deb/ipk [1] rootfs generation
>> in non Debian-based hosts fails because apt-ftparchive generates a
>> warn when not find /etc/apt/apt.conf.d/ (available in Debian-based
>> hosts).
>>
>> In order to fix,
>>
>> 	package_manager.py: DpkgPMIndexer add support for export APT_CONF
>> 	to environment.
>>
>> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=86aec93902af2e2d7d73ca9a643707fcca45055c
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>> ---
>>   meta/lib/oe/package_manager.py | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>> index c9a8084..395c0d01 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -169,7 +169,14 @@ class OpkgIndexer(Indexer):
>>   
>>   
>>   class DpkgIndexer(Indexer):
>> +    def __init__(self, d, deploy_dir, apt_conf_file=None):
>> +        self.apt_conf_file = apt_conf_file
>> +        Indexer.__init__(self, d, deploy_dir)
>> +
>>       def write_index(self):
>> +        if not self.apt_conf_file is None:
>> +            os.environ['APT_CONFIG'] = self.apt_conf_file
>> +
>>           pkg_archs = self.d.getVar('PACKAGE_ARCHS', True)
>>           if pkg_archs is not None:
>>               arch_list = pkg_archs.split()
>> @@ -1507,7 +1514,7 @@ class DpkgPM(PackageManager):
>>   
>>           self._create_configs(archs, base_archs)
>>   
>> -        self.indexer = DpkgIndexer(self.d, self.deploy_dir)
>> +        self.indexer = DpkgIndexer(self.d, self.deploy_dir, self.apt_conf_file)
>>   
>>       """
>>       This function will change a package's status in /var/lib/dpkg/status file.
>>
> unfortunately, this approach doesn't work with "bitbake package-index", which
> calls generate_index_files() in package_manager.py. That's why I implemented
> a quite ugly solution covering all cases:
>
>
>  From 668fe52b58aba6ab47e4712ee460ed7dd06c948f Mon Sep 17 00:00:00 2001
> From: Andreas Oberritter <obi@opendreambox.org>
> Date: Wed, 8 Oct 2014 15:52:22 +0200
> Subject: [PATCH] package_manager/deb: apt-ftparchive needs a valid config
>
> Without a valid config, apt-ftparchive aborts. Since apt-ftparchive
> defaults to /etc/apt if APT_CONFIG is unset, this is only an issue
> non non-Debian build hosts.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>   meta/lib/oe/package_manager.py | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index d4ac174..71f909c 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -182,6 +182,28 @@ class DpkgIndexer(Indexer):
>           all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
>           arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
>   
> +        apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt-ftparchive")
> +        apt_conf_file = os.path.join(apt_conf_dir, "apt.conf")
> +
> +        bb.utils.mkdirhier(apt_conf_dir)
> +        bb.utils.mkdirhier(apt_conf_dir + "/lists/partial/")
> +        bb.utils.mkdirhier(apt_conf_dir + "/apt.conf.d/")
> +        bb.utils.mkdirhier(apt_conf_dir + "/preferences.d/")
> +
> +        with open(os.path.join(apt_conf_dir, "preferences"), "w") as prefs_file:
> +            pass
> +        with open(os.path.join(apt_conf_dir, "sources.list"), "w+") as sources_file:
> +            pass
> +
> +        with open(apt_conf_file, "w") as apt_conf:
> +            with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
> +                for line in apt_conf_sample.read().split("\n"):
> +                    line = re.sub("#ROOTFS#", "/dev/null", line)
> +                    line = re.sub("#APTCONF#", apt_conf_dir, line)
> +                    apt_conf.write(line + "\n")
> +
> +        os.environ['APT_CONFIG'] = apt_conf_file
> +
>           apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
>           gzip = bb.utils.which(os.getenv('PATH'), "gzip")
>   


