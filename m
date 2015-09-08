Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2F276D96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:19:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2015 16:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,492,1437462000"; d="scan'208";a="785405892"
Received: from afshjern.zpn.intel.com (HELO [10.219.26.82]) ([10.219.26.82])
	by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2015 16:19:32 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
	<1440626255-29614-2-git-send-email-alejandro.franco@linux.intel.com>
	<1443154.Z0jeO7rfN8@peggleto-mobl.ger.corp.intel.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55EF6D2D.4080706@linux.intel.com>
Date: Tue, 8 Sep 2015 18:20:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443154.Z0jeO7rfN8@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] Empty image: core-image-empty recipe, Rootfs fix
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
X-List-Received-Date: Tue, 08 Sep 2015 23:19:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes indeed! Sorry, I didn't see this before!

Alex

On 08/29/2015 06:18 AM, Paul Eggleton wrote:
> Hi Alex,
>
> On Wednesday 26 August 2015 16:57:33 Alex Franco wrote:
>> Added a core-image-empty recipe, as well as a DpkgOpkgRootfs test
>> which skips the package post installs step, if PACKAGE_INSTALL is
>> empty.
>>
>> [YOCTO #7664]
>>
>> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
>> ---
>>   meta/lib/oe/rootfs.py                        | 6 +++++-
>>   meta/recipes-core/images/core-image-empty.bb | 7 +++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-core/images/core-image-empty.bb
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index 8c8244c..f8cc6eb 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -585,7 +585,11 @@ class DpkgOpkgRootfs(Rootfs):
>>
>>           pkg_list = []
>>
>> -        pkgs = self._get_pkgs_postinsts(status_file)
>> +        pkgs = None
>> +        if not self.d.getVar('PACKAGE_INSTALL', True).strip():
>> +            bb.note("Building empty image")
>> +        else:
>> +            pkgs = self._get_pkgs_postinsts(status_file)
>>           if pkgs:
>>               root = "__packagegroup_postinst__"
>>               pkgs[root] = pkgs.keys()
>> diff --git a/meta/recipes-core/images/core-image-empty.bb
>> b/meta/recipes-core/images/core-image-empty.bb new file mode 100644
>> index 0000000..550567c
>> --- /dev/null
>> +++ b/meta/recipes-core/images/core-image-empty.bb
>> @@ -0,0 +1,7 @@
>> +SUMMARY = "An empty image."
>> +IMAGE_INSTALL = ""
>> +IMAGE_LINGUAS = ""
>> +PACKAGE_INSTALL = ""
>> +LICENSE = "MIT"
>> +
>> +inherit image
> Could you please put this image recipe into meta-selftest instead (call it oe-
> selftest-empty-image.bb) and add an oe-selftest test to ensure it builds and
> is empty?
>
> Thanks,
> Paul
>


