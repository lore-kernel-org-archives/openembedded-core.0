Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21649C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 14:52:18 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.50528.1654008733830526741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id 45F7E5674;
	Tue, 31 May 2022 16:52:09 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.125]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw3E6-0BubMf0; Tue, 31 May 2022 16:52:06 +0200
Content-Type: multipart/alternative;
 boundary="------------hmZkOySoIOqVKLZLOgNCE1dH"
Message-ID: <466ed7c2-73b6-2a39-8209-4afa5404ec7d@t-online.de>
Date: Tue, 31 May 2022 16:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH 1/2] nghttp2: unbreak do_populate_sdk
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20220524144924.252281-1-f_l_k@t-online.de>
 <116102a880d732f3ea406a61fc77d44f66aa9d02.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <116102a880d732f3ea406a61fc77d44f66aa9d02.camel@linuxfoundation.org>
X-TOI-EXPURGATEID: 150726::1654008726-01421A9A-E127EE0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 69be0c20-d6ef-4629-91e8-8cebefc9d505
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 14:52:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166317

This is a multi-part message in MIME format.
--------------hmZkOySoIOqVKLZLOgNCE1dH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm not sure but since this error happened while trying to build 
nativesdk-nghttp2 i think the issue is, that RDEPENDS are removed for 
native but not for nativesdk.

    RDEPENDS:${PN}:class-native = ""

Other possible fixes then should be either to remove them also for nativesdk

    RDEPENDS:${PN}:class-nativesdk = ""

or adding RDEPENDS on client/server for class-target only

    RDEPENDS:${PN}:class-target = "${PN}-client (>= ${PV}) ${PN}-proxy
    (>= ${PV}) ${PN}-server (>= ${PV})"


Markus


Am 31.05.22 um 16:21 schrieb richard.purdie@linuxfoundation.org:
> On Tue, 2022-05-24 at 16:49 +0200, Markus Volk wrote:
>> Error:
>>   Problem 1: package nghttp2-dev-1.47.0-r0.corei7_64 requires nghttp2 = 1.47.0-r0, but none of the providers can be installed
>>    - conflicting requests
>>    - nothing provides nghttp2-client >= 1.47.0 needed by nghttp2-1.47.0-r0.corei7_64
>>    - nothing provides nghttp2-server >= 1.47.0 needed by nghttp2-1.47.0-r0.corei7_64
>>
>> Signed-off-by: Markus Volk<f_l_k@t-online.de>
>> ---
>>   meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
>> index 58ce08084d..051a6e4ecb 100644
>> --- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
>> +++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
>> @@ -21,7 +21,7 @@ EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF
>>   
>>   PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
>>   
>> -RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
>> +RRECOMMENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
>>   RDEPENDS:${PN}:class-native = ""
>>   RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
>>   
> I'm not sure this is correct as if the dependencies are incorrect we
> shouldn't be making then RRECOMMENDS? What is the real issue here?
>
> Cheers,
>
> Richard
>
>
--------------hmZkOySoIOqVKLZLOgNCE1dH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>I'm not sure but since this error happened while trying to build
      nativesdk-nghttp2 i think the issue is, that RDEPENDS are removed
      for native but not for nativesdk. </p>
    <blockquote>
      <p>RDEPENDS:${PN}:class-native = ""</p>
    </blockquote>
    <p>Other possible fixes then should be either to remove them also
      for nativesdk<br>
    </p>
    <blockquote>
      <p>RDEPENDS:${PN}:class-nativesdk = ""</p>
    </blockquote>
    <p>or adding RDEPENDS on client/server for class-target only<br>
    </p>
    <blockquote>
      <p>RDEPENDS:${PN}:class-target = "${PN}-client (&gt;= ${PV})
        ${PN}-proxy (&gt;= ${PV}) ${PN}-server (&gt;= ${PV})"</p>
    </blockquote>
    <p><br>
    </p>
    <p>Markus<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 31.05.22 um 16:21 schrieb
      <a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>:<br>
    </div>
    <blockquote type="cite"
cite="mid:116102a880d732f3ea406a61fc77d44f66aa9d02.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Tue, 2022-05-24 at 16:49 +0200, Markus Volk wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Error:
 Problem 1: package nghttp2-dev-1.47.0-r0.corei7_64 requires nghttp2 = 1.47.0-r0, but none of the providers can be installed
  - conflicting requests
  - nothing provides nghttp2-client &gt;= 1.47.0 needed by nghttp2-1.47.0-r0.corei7_64
  - nothing provides nghttp2-server &gt;= 1.47.0 needed by nghttp2-1.47.0-r0.corei7_64

Signed-off-by: Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index 58ce08084d..051a6e4ecb 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -21,7 +21,7 @@ EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF
 
 PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
-RDEPENDS:${PN} = "${PN}-client (&gt;= ${PV}) ${PN}-proxy (&gt;= ${PV}) ${PN}-server (&gt;= ${PV})"
+RRECOMMENDS:${PN} = "${PN}-client (&gt;= ${PV}) ${PN}-proxy (&gt;= ${PV}) ${PN}-server (&gt;= ${PV})"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not sure this is correct as if the dependencies are incorrect we
shouldn't be making then RRECOMMENDS? What is the real issue here?

Cheers,

Richard


</pre>
    </blockquote>
  </body>
</html>

--------------hmZkOySoIOqVKLZLOgNCE1dH--

