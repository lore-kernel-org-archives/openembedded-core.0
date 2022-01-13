Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EA3C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 15:44:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.10509.1642088673325974488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 07:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPKre2GL;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id x22so20851109lfd.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 07:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject;
        bh=SKZGZQUHUJYO+glgWQO64N+J+jbqEG/I8jLeEh9xV3Y=;
        b=bPKre2GLCBbA2w1nQlphMaae3zmjbgFSCI4lSDcekXwUgDwMZeHHpxA+MHYqgh01cy
         hKO2i9dIBkSsxQzIxGuuda+LbFXncUwpg78anILU9QiN0bZt4Ul7CwW2eAz0RBhHdOd6
         d3oiGyfZpToAc4bFocq43c1Z8Jyx35Iu0XBFBLfSwukCsZO6Qo55Ymvhih94egVjbcEu
         cxLmgvQ3cTRczlD1HjI8Kh+Vdbk9mZcbHSxI4hoMuLE7KT/m4DYkeXRPoEwVU0bQDkUq
         35OZZDyEr0OcdK2ChlEHAmQcA3xDSVRzLSeXiJBWDfYYwWGMIC0HiG9TpiPzKM/pJ0cq
         w0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject;
        bh=SKZGZQUHUJYO+glgWQO64N+J+jbqEG/I8jLeEh9xV3Y=;
        b=4bDV4xnBeddidr2cAxDSuXKcoczgar4fwnNP6dlzmMJof9Yk7CwzaZUiudf7YQ0wnm
         SKhGUcJ6gjWedJKp5S3P/QGIzx4FAIXBTwOGh3hk6ysNnQo/BxtYyiYeON+KLKra4uY6
         XrU/Pf8Bv8GXjohJxiox8+U64f/05lsJKsiJdEXSYHL1G6WJU96JDaMZn/Dclb6QzClK
         xtpqU/FwK4yAe7mT3UZnA4JrQwj4b4ETIP1ySp9So2TRnCagUnP14h5drND4cgwMtj+3
         Dowi/JRUAkX8SCgGhRCYRgSdfQb4RczZK/IvedpmW/K8LQCtEwCYbpbZJpI+wDVmS92q
         OO3Q==
X-Gm-Message-State: AOAM531MiywaNbHquZC8sES0rRPUIoy9fQlQONYIctcn+9oqxcdrVFxF
	+0RheAJfZ42rLRr+s4jTFnMIfmcBAfc=
X-Google-Smtp-Source: 
 ABdhPJxDLzdUU+wnvvR9vecuyAn17lxhLCYPbu7jaq3Samj/D1Gzcz4oK5+d7mCJ2LI9Mn8GUKSu9g==
X-Received: by 2002:a05:6512:acd:: with SMTP id
 n13mr2790864lfu.283.1642088671301;
        Thu, 13 Jan 2022 07:44:31 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 x22sm301104ljp.128.2022.01.13.07.44.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 07:44:30 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------uNIhd319SC6He1N9KQxgSybW"
Message-ID: <f914d2c4-b3eb-f52b-6010-0447ac874fb5@gmail.com>
Date: Thu, 13 Jan 2022 16:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Subject: Zero umask when unpacking sstate packages
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 15:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160525

This is a multi-part message in MIME format.
--------------uNIhd319SC6He1N9KQxgSybW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I often see this diff churn in my buildistory for shadow-native (and
similar issues with icedtea7-native from meta-java):

-drwxr-xr-x -          -                  40 ./var/spool/mail
+drwxrwxr-x -          -                  40 ./var/spool/mail

One can reproduce it with:

# bitbake -c cleansstate shadow-native && \
  bitbake shadow-native && \
  bitbake -c clean shadow-native && \
  bitbake shadow-native

I see that the sstate package contains the correct permissions for
'mail', 775. So it would seem to me that it is the unpacking from sstate
that strips the group write permission.

Testing with the attached patch and the problem goes away.

Is something like this the correct solution ?

Jacob
--------------uNIhd319SC6He1N9KQxgSybW
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-sstate.bbclass-Zero-umask-when-unpacking-from-sstate.patch"
Content-Disposition: attachment;
 filename*0="0001-sstate.bbclass-Zero-umask-when-unpacking-from-sstate.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkY2ViZjI5NzdjYjZiZGM1MTk4YWIxMzI3MmNmMzU4YzllY2Q2YjMyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKYWNvYiBLcm9vbiA8amFjb2Iua3Jvb25AZ21haWwu
Y29tPgpEYXRlOiBUaHUsIDEzIEphbiAyMDIyIDE2OjMxOjQ3ICswMTAwClN1YmplY3Q6IFtQ
QVRDSF0gc3N0YXRlLmJiY2xhc3M6IFplcm8gdW1hc2sgd2hlbiB1bnBhY2tpbmcgZnJvbSBz
c3RhdGUgY2FjaGUKClNpZ25lZC1vZmYtYnk6IEphY29iIEtyb29uIDxqYWNvYi5rcm9vbkBn
bWFpbC5jb20+Ci0tLQogbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy9zc3RhdGUuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFzcwppbmRleCA2
NDUzNzdmZGQ4Li4wYzMyMzg3ZjQzIDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMvc3N0YXRl
LmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzCkBAIC03OTMsNyAr
NzkzLDkgQEAgcHN0YWdpbmdfZmV0Y2hbdmFyZGVwc2V4Y2x1ZGVdICs9ICJTUkNQViIKIAog
ZGVmIHNzdGF0ZV9zZXRzY2VuZShkKToKICAgICBzaGFyZWRfc3RhdGUgPSBzc3RhdGVfc3Rh
dGVfZnJvbXZhcnMoZCkKKyAgICBvbWFzayA9IG9zLnVtYXNrKDApCiAgICAgYWNjZWxlcmF0
ZSA9IHNzdGF0ZV9pbnN0YWxscGtnKHNoYXJlZF9zdGF0ZSwgZCkKKyAgICBvcy51bWFzayhv
bWFzaykKICAgICBpZiBub3QgYWNjZWxlcmF0ZToKICAgICAgICAgYmIuZmF0YWwoIk5vIHN1
aXRhYmxlIHN0YWdpbmcgcGFja2FnZSBmb3VuZCIpCiAK
--------------uNIhd319SC6He1N9KQxgSybW--


