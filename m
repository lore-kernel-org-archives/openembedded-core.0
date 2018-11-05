Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C971C79CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 02:32:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA52WcOh000582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Nov 2018 18:32:38 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 4 Nov 2018 18:32:37 -0800
To: akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1541138869-68039-1-git-send-email-changqing.li@windriver.com>
	<0b5058fb-32b2-4bef-5847-cfe49689acbc@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <d54b06bb-258f-5536-f67a-34fa9faf4104@windriver.com>
Date: Mon, 5 Nov 2018 10:32:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <0b5058fb-32b2-4bef-5847-cfe49689acbc@gmail.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] curl: fix for CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
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
X-List-Received-Date: Mon, 05 Nov 2018 02:32:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/3/18 12:05 AM, akuster808 wrote:
> On 11/1/18 11:07 PM, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../recipes-support/curl/curl/CVE-2018-16839.patch | 35 ++++++++++++++++++
>>   .../recipes-support/curl/curl/CVE-2018-16840.patch | 43 ++++++++++++++++++++++
>>   .../recipes-support/curl/curl/CVE-2018-16842.patch | 35 ++++++++++++++++++
>>   3 files changed, 113 insertions(+)
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16839.patch
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16840.patch
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16842.patch
>
> curl update to 7.61.1 is in Master-next. do this also affect that version?
>
> - armin

Yes,  These 3 CVEs all affected version 7.61.1


//changqing

>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16839.patch b/meta/recipes-support/curl/curl/CVE-2018-16839.patch
>> new file mode 100644
>> index 0000000..bf972d2
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2018-16839.patch
>> @@ -0,0 +1,35 @@
>> +From 55b90532f9190dce40a325b3312d014c66dc3ae1 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 1 Nov 2018 15:27:35 +0800
>> +Subject: [PATCH] Curl_auth_create_plain_message: fix too-large-input-check
>> +
>> +CVE-2018-16839
>> +Reported-by: Harry Sintonen
>> +Bug: https://curl.haxx.se/docs/CVE-2018-16839.html
>> +
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit
>> +/f3a24d7916b9173c69a3e0ee790102993833d6c5?diff=unified]
>> +
>> +CVE: CVE-2018-16839
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + lib/vauth/cleartext.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/lib/vauth/cleartext.c b/lib/vauth/cleartext.c
>> +index 5d61ce6..1367143 100644
>> +--- a/lib/vauth/cleartext.c
>> ++++ b/lib/vauth/cleartext.c
>> +@@ -74,7 +74,7 @@ CURLcode Curl_auth_create_plain_message(struct Curl_easy *data,
>> +   plen = strlen(passwdp);
>> +
>> +   /* Compute binary message length. Check for overflows. */
>> +-  if((ulen > SIZE_T_MAX/2) || (plen > (SIZE_T_MAX/2 - 2)))
>> ++  if((ulen > SIZE_T_MAX/4) || (plen > (SIZE_T_MAX/2 - 2)))
>> +     return CURLE_OUT_OF_MEMORY;
>> +   plainlen = 2 * ulen + plen + 2;
>> +
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16840.patch b/meta/recipes-support/curl/curl/CVE-2018-16840.patch
>> new file mode 100644
>> index 0000000..3d086c4
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2018-16840.patch
>> @@ -0,0 +1,43 @@
>> +From 3c2846bec008e03d456e181d9ab55686da83f140 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 1 Nov 2018 15:33:35 +0800
>> +Subject: [PATCH] Curl_close: clear data->multi_easy on free to avoid
>> + use-after-free
>> +
>> +Regression from b46cfbc (7.59.0)
>> +CVE-2018-16840
>> +Reported-by: Brian Carpenter (Geeknik Labs)
>> +
>> +Bug: https://curl.haxx.se/docs/CVE-2018-16840.html
>> +
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/
>> +81d135d67155c5295b1033679c606165d4e28f3f]
>> +
>> +CVE: CVE-2018-16840
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + lib/url.c | 4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/lib/url.c b/lib/url.c
>> +index 27b2c1e..7ef7c20 100644
>> +--- a/lib/url.c
>> ++++ b/lib/url.c
>> +@@ -320,10 +320,12 @@ CURLcode Curl_close(struct Curl_easy *data)
>> +        and detach this handle from there. */
>> +     curl_multi_remove_handle(data->multi, data);
>> +
>> +-  if(data->multi_easy)
>> ++  if(data->multi_easy) {
>> +     /* when curl_easy_perform() is used, it creates its own multi handle to
>> +        use and this is the one */
>> +     curl_multi_cleanup(data->multi_easy);
>> ++    data->multi_easy = NULL;
>> ++  }
>> +
>> +   /* Destroy the timeout list that is held in the easy handle. It is
>> +      /normally/ done by curl_multi_remove_handle() but this is "just in
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16842.patch b/meta/recipes-support/curl/curl/CVE-2018-16842.patch
>> new file mode 100644
>> index 0000000..82e7557
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2018-16842.patch
>> @@ -0,0 +1,35 @@
>> +From 0e4a6058b130f07cfa52fde8a3cb6f2abfe4c700 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 1 Nov 2018 15:30:56 +0800
>> +Subject: [PATCH] voutf: fix bad arethmetic when outputting warnings to stderr
>> +
>> +CVE-2018-16842
>> +Reported-by: Brian Carpenter
>> +Bug: https://curl.haxx.se/docs/CVE-2018-16842.html
>> +
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit
>> +/d530e92f59ae9bb2d47066c3c460b25d2ffeb211]
>> +
>> +CVE: CVE-2018-16842
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + src/tool_msgs.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/tool_msgs.c b/src/tool_msgs.c
>> +index 9cce806..05bec39 100644
>> +--- a/src/tool_msgs.c
>> ++++ b/src/tool_msgs.c
>> +@@ -67,7 +67,7 @@ static void voutf(struct GlobalConfig *config,
>> +         (void)fwrite(ptr, cut + 1, 1, config->errors);
>> +         fputs("\n", config->errors);
>> +         ptr += cut + 1; /* skip the space too */
>> +-        len -= cut;
>> ++        len -= cut + 1;
>> +       }
>> +       else {
>> +         fputs(ptr, config->errors);
>> +--
>> +2.7.4
>> +

-- 
BRs

Sandy(Li Changqing)


