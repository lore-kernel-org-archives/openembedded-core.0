Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QafDW-00083U-KV
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 04:36:59 +0200
Received: by pzk36 with SMTP id 36so2748050pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2011 19:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xMMGYPGp2qTcXMZds4CDSQF2Mf/1iar+KZoqCKDDcmk=;
	b=v9+90ncUpBeNJPXBfwLBE9o4w6fv1YCwyOKpMsHac1bF4wNIGJK+UbvsebPCbZ+VWx
	cHK7mTTeLr+kcqYkmUZDPGh+E3Ii1+ff5jBR8uaMvC2zm/qhO4ZuyflNP9x8tahLOsWe
	L87s6CVwMoym5JT2CipwcdqlxhYECLNeJAYDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=nEOSZltQcEANa3N7cJq8PbZt5lugZdDHoCC2xPXeP+2uDotnkGgznxhu8bYlK5JZgj
	ZU9PkhGr2ST4sQIGpgSxV5E34qmiiV92ORqsKkLk0JFwQJv64BgR+z3KwZx+zmH//GNw
	g5L3+tjn/UZ7Y4JXeLQqNjVfeeOCfxzpviCRQ=
Received: by 10.142.202.21 with SMTP id z21mr953600wff.83.1309055598806;
	Sat, 25 Jun 2011 19:33:18 -0700 (PDT)
Received: from [192.168.1.82] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k2sm3417962wfe.3.2011.06.25.19.33.17
	(version=SSLv3 cipher=OTHER); Sat, 25 Jun 2011 19:33:18 -0700 (PDT)
Message-ID: <4E069A74.1070402@gmail.com>
Date: Sat, 25 Jun 2011 19:33:24 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308592651.git.josh@linux.intel.com>	<909a6c756247a7a0f68f60a64477d4e8419ca74c.1308593086.git.josh@linux.intel.com>
	<4E068312.5090507@linux.intel.com>
In-Reply-To: <4E068312.5090507@linux.intel.com>
Subject: Re: [PATCH 2/2] sanity: implement network connectivity test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2011 02:36:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/2011 5:53 PM, Saul Wold wrote:
> On 06/20/2011 11:09 AM, Joshua Lock wrote:
>> Sanity test to verify files can be fetched from the network using git,
>> http
>> and https fetchers point users at a page to help get set up in the
>> case of a
>> failure.
>>
>> Addresses [YOCTO #933]
>>
>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>> ---
>> meta/classes/sanity.bbclass | 34 ++++++++++++++++++++++++++++++++++
>> 1 files changed, 34 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index bffa4f5..650df5f 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
>>
>> # Check that TMPDIR isn't on a filesystem with limited filename length
>> (eg. eCryptFS)
>> testmsg = check_create_long_filename(tmpdir, "TMPDIR")
>> + # Check that we can fetch from various network transports
>> + testmsg = testmsg + check_connectivity(data)
>> return testmsg
>>
>> def check_sanity_version_change(data):
>> @@ -75,6 +77,38 @@ def check_create_long_filename(filepath, pathname):
>> return "Failed to create a file in %s: %s" % (pathname, strerror)
>> return ""
>>
>> +def check_connectivity(d):
>> + # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
>> using
>> + # the same syntax as SRC_URI.
>> + test_uris = (bb.data.getVar('CONNECTIVITY_CHECK_URIS', d, True) or
>> "").split()
>> + # If no URI's set, fallback to some default ones we know of
>> + if len(test_uris) == 0:
>> + test_uris = ["http://yoctoproject.org/about",
>> +
>> "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
>>
>> + "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
>> + retval = ""

imo this change is yocto specific doesnt belong to core
>> +
>> + # Only check connectivity if network access and this check enabled.
>> + # Because it's a fairly heavy test allow disabling of just this
>> sanity test
>> + # by setting DISABLE_NETWORK_SANITY.
>> + network_disabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
>> + check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', d, True)
>> + if check_disabled or network_disabled:
>> + data = bb.data.createCopy(d)
>> + dldir = bb.data.expand('${TMPDIR}/sanity', data)
>> + bb.data.setVar('DL_DIR', dldir, data)
>> +
>> + try:
>> + fetcher = bb.fetch2.Fetch(test_uris, data)
>> + fetcher.download()
>> + fetcher.clean(test_uris)
>> + except Exception:
>> + retval = "Error connecting to the network to fetch, http/https and
>> git checked.\nPlease check the wiki
>> (https://wiki.yoctoproject.org/wiki/Connectivity\%20Troubleshooting)
>> for more suggestions.\n"
>> + finally:
>> + # Make sure we tidy up the cruft
>> + oe.path.remove(dldir)
>> + return retval
>> +
>> def check_sanity(e):
>> from bb import note, error, data, __version__
>>
>
> Josh,
>
> When I ran this, I got the following messages about missing SRC_URI
> Checksums and then it failed to parse recipes. When I removed this
> commit things worked normally.
>
>
>
> Pseudo is not present but is required, building this first before the
> main build
> Cloning into bare repository
> /intel/poky2/builds/pending/tmp/sanity/git2/git.yoctoproject.org.yocto-firewall-test...
>
> NOTE: fetch http://yoctoproject.org/about
> WARNING: Missing SRC_URI checksum for
> /intel/poky2/builds/pending/tmp/sanity/about, consider adding to the
> recipe:
> SRC_URI[md5sum] = "1ca6c9ee2ce5dc5d251e649cbd4e339f"
> SRC_URI[sha256sum] =
> "24cda768cacaf6cc41ab75a46df4936f58075c4788e094c262c35d5ba69544e2"
> NOTE: fetch
> https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0
> WARNING: Missing SRC_URI checksum for
> /intel/poky2/builds/pending/tmp/sanity/crownbay-bernard-5.0.0, consider
> adding to the recipe:
> SRC_URI[md5sum] = "c534ba257c640e47300572607762b22a"
> SRC_URI[sha256sum] =
> "485812cf1c43381d70611e85eaf8a74982b452121bdc92accf7a62f0a2707137"
> NOTE: fetch
> http://autobuilder.yoctoproject.org/sources/git2_git.yoctoproject.org.yocto-firewall-test.tar.gz
>
> Parsing recipes...ERROR: Command execution failed: Exited with 1
> NOTE: fetch
> http://autobuilder.yoctoproject.org/sources/git2_git.yoctoproject.org.yocto-firewall-test.tar.gz
>
> WARNING: Missing SRC_URI checksum for
> /intel/poky2/builds/pending/tmp/sanity/crownbay-bernard-5.0.0, consider
> adding to the recipe:
> SRC_URI[md5sum] = "c534ba257c640e47300572607762b22a"
> SRC_URI[sha256sum] =
> "485812cf1c43381d70611e85eaf8a74982b452121bdc92accf7a62f0a2707137"
> NOTE: fetch
> https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0
> WARNING: Missing SRC_URI checksum for
> /intel/poky2/builds/pending/tmp/sanity/about, consider adding to the
> recipe:
> SRC_URI[md5sum] = "1ca6c9ee2ce5dc5d251e649cbd4e339f"
> SRC_URI[sha256sum] =
> "24cda768cacaf6cc41ab75a46df4936f58075c4788e094c262c35d5ba69544e2"
> NOTE: fetch http://yoctoproject.org/about
>
> Thanks
> Sau!
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



