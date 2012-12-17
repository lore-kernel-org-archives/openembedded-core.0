Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TkfWf-0000f0-WC
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 19:34:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 10:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,303,1355126400"; d="scan'208";a="263252867"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2012 10:20:11 -0800
Message-ID: <50CF625B.9080907@linux.intel.com>
Date: Mon, 17 Dec 2012 10:20:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
References: <1355378061-7514-1-git-send-email-li.wang@windriver.com>
	<50CF5FD5.2000003@linux.intel.com>
In-Reply-To: <50CF5FD5.2000003@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxml2 CVE-2012-2871
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 18:34:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2012 10:09 AM, Saul Wold wrote:
>
> Li,
>
> All your recent CVE patches are missing Upsteam-Status: Backport in the
> patch header, please add that and send V2's!
>
You will need to just send patch header updates since these patches are 
pulled into Master already

> Thanks
>      Sau!
>
>
> On 12/12/2012 09:54 PM, Li Wang wrote:
>> the patch come from:
>> http://src.chromium.org/viewvc/chrome/trunk/src/third_party/libxml/src \
>> /include/libxml/tree.h?r1=56276&r2=149930
>>
>> libxml2 2.9.0-rc1 and earlier, as used in Google Chrome before
>> 21.0.1180.89,
>> does not properly support a cast of an unspecified variable during
>> handling
>> of XSL transforms, which allows remote attackers to cause a denial of
>> service
>> or possibly have unknown other impact via a crafted document, related
>> to the
>> _xmlNs data structure in include/libxml/tree.h.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2871
>>
>> [YOCTO #3580]
>> [ CQID: WIND00376779 ]
>> Upstream-Status: Pending
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> ---
>>   .../libxml/libxml2/libxml2-CVE-2012-2871.patch     | 34
>> ++++++++++++++++++++++
>>   meta/recipes-core/libxml/libxml2_2.9.0.bb          |  5 +++-
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
>>
>> diff --git
>> a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
>> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
>> new file mode 100644
>> index 0000000..3c66a9c
>> --- /dev/null
>> +++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
>> @@ -0,0 +1,34 @@
>> +libxml2 CVE-2012-2871
>> +
>> +the patch come from:
>> +http://src.chromium.org/viewvc/chrome/trunk/src/third_party/libxml/src \
>> +/include/libxml/tree.h?r1=56276&r2=149930
>> +
>> +libxml2 2.9.0-rc1 and earlier, as used in Google Chrome before
>> 21.0.1180.89,
>> +does not properly support a cast of an unspecified variable during
>> handling
>> +of XSL transforms, which allows remote attackers to cause a denial of
>> service
>> +or possibly have unknown other impact via a crafted document, related
>> to the
>> +_xmlNs data structure in include/libxml/tree.h.
>> +
>> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2871
>> +
>> +Signed-off-by: Li Wang <li.wang@windriver.com>
>> +---
>> + include/libxml/tree.h |    1 +
>> + 1 files changed, 1 insertions(+), 0 deletions(-)
>> +
>> +diff --git a/include/libxml/tree.h b/include/libxml/tree.h
>> +index b733589..5422dda 100644
>> +--- a/include/libxml/tree.h
>> ++++ b/include/libxml/tree.h
>> +@@ -351,6 +351,7 @@ struct _xmlNs {
>> +     struct _xmlNs  *next;    /* next Ns link for this node  */
>> +     xmlNsType      type;    /* global or local */
>> +     const xmlChar *href;    /* URL for the namespace */
>> ++    const char *dummy_children;    /* lines up with node->children */
>> +     const xmlChar *prefix;    /* prefix for the namespace */
>> +     void           *_private;   /* application data */
>> +     struct _xmlDoc *context;        /* normally an xmlDoc */
>> +--
>> +1.7.0.5
>> +
>> diff --git a/meta/recipes-core/libxml/libxml2_2.9.0.bb
>> b/meta/recipes-core/libxml/libxml2_2.9.0.bb
>> index a022ae9..ecc19fb 100644
>> --- a/meta/recipes-core/libxml/libxml2_2.9.0.bb
>> +++ b/meta/recipes-core/libxml/libxml2_2.9.0.bb
>> @@ -1,6 +1,9 @@
>>   require libxml2.inc
>>
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>
>>   SRC_URI[md5sum] = "5b9bebf4f5d2200ae2c4efe8fa6103f7"
>>   SRC_URI[sha256sum] =
>> "ad25d91958b7212abdc12b9611cfb4dc4e5cddb6d1e9891532f48aacee422b82"
>> +
>> +SRC_URI += "file://libxml2-CVE-2012-2871.patch \
>> +       "
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


