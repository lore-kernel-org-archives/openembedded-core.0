Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 049596C7A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:36:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8H2ahn2025327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Sep 2013 19:36:43 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 16 Sep 2013 19:36:43 -0700
Message-ID: <5237C039.4080001@windriver.com>
Date: Tue, 17 Sep 2013 10:36:41 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
	<C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
In-Reply-To: <C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Tue, 17 Sep 2013 02:36:44 -0000
Content-Type: multipart/alternative;
	boundary="------------060805050308030504070001"

--------------060805050308030504070001
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2013 01:09 AM, Khem Raj wrote:
> On Sep 16, 2013, at 4:14 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> The commit
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8780c5ddf2916bbd42fc67b79c286652aebb1546
>> add a patch to fix a security issue. It modify include file 'tree.h'
>> to add 'const char *dummy_children' on 'struct _xmlNs'.
>>
>> But lsb test suites didn't do this in his own include file, so the LSB
>> desktop-xml tests failed.
> IMO the testcase should be fixed. This is security patch that you are disabling. I don't think LSB compliance
> should mean less secure
>

The upstream of libxml2 has not fixed this issue:
git clone git://git.gnome.org/libxml2

And I have filed a bug to them
https://bugzilla.gnome.org/show_bug.cgi?id=708205

After this is fixed and released, also need to report another
bug to LSB to update their libxml2 source code.

The time cycle is long, should we mark this bug as "Waiting For Upstream"
or accept this patch to workaround for LSB test.

Thanks,
Hongxu

>> Disable this patch for linuxstdbase could fix this issue.
>>
>> [YOCTO #5151]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>> meta/recipes-core/libxml/libxml2_2.9.1.bb | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.1.bb
>> index fa9c657..3b031a1 100644
>> --- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
>> +++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
>> @@ -1,6 +1,9 @@
>> require libxml2.inc
>>
>> -SRC_URI += "file://libxml2-CVE-2012-2871.patch \
>> +LIBXML2_CVE = "file://libxml2-CVE-2012-2871.patch"
>> +LIBXML2_CVE_linuxstdbase = ""
>> +
>> +SRC_URI += "${LIBXML2_CVE} \
>>              http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
>> 	   "
>>
>> -- 
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------060805050308030504070001
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/17/2013 01:09 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
      cite="mid:C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com"
      type="cite">
      <pre wrap="">
On Sep 16, 2013, at 4:14 AM, Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">The commit
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8780c5ddf2916bbd42fc67b79c286652aebb1546">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8780c5ddf2916bbd42fc67b79c286652aebb1546</a>
add a patch to fix a security issue. It modify include file 'tree.h'
to add 'const char *dummy_children' on 'struct _xmlNs'.

But lsb test suites didn't do this in his own include file, so the LSB
desktop-xml tests failed.
</pre>
      </blockquote>
      <pre wrap="">
IMO the testcase should be fixed. This is security patch that you are disabling. I don't think LSB compliance
should mean less secure

</pre>
    </blockquote>
    <br>
    The upstream of libxml2 has not fixed this issue:<br>
    git clone git://git.gnome.org/libxml2<br>
    <br>
    And I have filed a bug to them<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a href="https://bugzilla.gnome.org/show_bug.cgi?id=708205">https://bugzilla.gnome.org/show_bug.cgi?id=708205</a><br>
    <br>
    After this is fixed and released, also need to report another<br>
    bug to LSB to update their libxml2 source code.<br>
    <br>
    The time cycle is long, should we mark this bug as "Waiting For
    Upstream"<br>
    or accept this patch to workaround for LSB test.<br>
    <br>
    Thanks,<br>
    Hongxu<br>
    <br>
    <blockquote
      cite="mid:C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">
Disable this patch for linuxstdbase could fix this issue.

[YOCTO #5151]

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
meta/recipes-core/libxml/libxml2_2.9.1.bb | 5 ++++-
1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.1.bb
index fa9c657..3b031a1 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
@@ -1,6 +1,9 @@
require libxml2.inc

-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://libxml2-CVE-2012-2871.patch\+LIBXML2_CVE=">"file://libxml2-CVE-2012-2871.patch \
+LIBXML2_CVE = "</a<a class="moz-txt-link-rfc2396E" href="file://libxml2-CVE-2012-2871.patch">"file://libxml2-CVE-2012-2871.patch"</a>
+LIBXML2_CVE_linuxstdbase = ""
+
+SRC_URI += "${LIBXML2_CVE} \
            <a class="moz-txt-link-freetext" href="http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar">http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar</a> \
	   "

-- 
1.8.1.2

_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060805050308030504070001--
