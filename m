Return-Path: <jonas@norrbonn.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC1810ED658
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 10:28:38 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69730.1774607307991002952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 03:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norrbonn-se.20230601.gappssmtp.com header.s=20230601 header.b=mlcorrk9;
 spf=pass (domain: norrbonn.se, ip: 209.85.167.48, mailfrom: jonas@norrbonn.se)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso2165570e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20230601.gappssmtp.com; s=20230601; t=1774607305; x=1775212105; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFcBVgIiLPs95a/CSXBgrNtdGqw8lsavu3WqohGdLts=;
        b=mlcorrk9OozBdS1qgU8u79AYDCJ2x7MnceWbnvJvEx4ke0SeX0O7lCaCUCbXInL1WN
         4txdpPdQYXqFDsOwbg6Nss7nO0uB4qKYj3X1lldALT7vx1KgVFWrucXGKCQNGE3BroLL
         mmjPo98zM6kR4YaVLssQTxUHBlGyiwZuExJeAn+7h5/iD/8okKgzRth48fiHEID5qyZg
         Ebe+6u5C9AxevhkKHCLokwvDoVtR9DBnj7zh9T9sJ8JxwohkWUdM7UUBe3Rf06AqtT84
         aaCmWpq3qhdBHC7r3e1iInoN7N1qJ8fyJh4wFCbjLgK/qQJcQox+wADo9eqluA3EBBBb
         8qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607305; x=1775212105;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JFcBVgIiLPs95a/CSXBgrNtdGqw8lsavu3WqohGdLts=;
        b=L3jIyS6RvSym8ccoy78WUIolhkmPBs/Wpurw90CPuzA/uNYZvPPxx1SlK2Buetiyw/
         Ke8MEOlUZGk1rElsR0dYFbSmxNZPckLJLduHcCbqWH8Y1h7zRSSzwIMoh8bvxG7+oksO
         C5dylif/EfXBEMR7LpNxiXWMdz2PQEbg+Hgcfa+41YzLNln+qF3+XkUZN6elGNeAUQP6
         RSjgETk/R0QwgmLo3WcPD2SbiMLScEifHllGVCl8Nkp5C3fzHooRiZKIcK9VyW2qsR43
         u/2VP307NrfEcQD3/qtz3n7e7vWxVRq2EeQCy39JcmE1yco6mKZ6VqVrUex3AJ5QWeP3
         oTIw==
X-Gm-Message-State: AOJu0YwtFpO9nbuC2eftw1RqroTZ/Ma0Hebg7qkP/koI+QjMi2iyFoKh
	mIYbBoQ+k+Kjg2Zuzy0l+b5jn9wnQpGGCiiwgSv10unT3poHkilTywmwCz9PhWHFoeu5fWSDXS2
	IKjsn
X-Gm-Gg: ATEYQzz4h1aBJ1fnZUd7UpuI6ZJAsH9qBFVJxITRwG84/QPjHADGPvpABt1/dyyMeWQ
	Mr/Ffd4AugA01QqkT8ydKsxD22rwM0Tis6qVD1WXC2HTD28W8r+vUl6uu04VletJy4eOqVZV5Od
	MO8tn8B8VdpSg0xZP8LLaS8zxwnwTAjQ1Xa8V9eOlHEsEZI8quFbA0wnHuQ5NicoVTf+v39i3Zw
	pnjCo8C/pu1uYFAkKQqHq78BsZYWX6SGnwObpOtI7xZvQ0xWJ1PVpREc4rpLp+l/B6z/THsoNAW
	miA2ePlaN3AAERhawpZonpVXchO7rBFQsn2yo/Bq+0sH/HA8Vj9j/CY3I/b7hr9l57W9dhnejGj
	o1PwXNJiCAfKHv4OgvCfU0oNOW3uyILQRKNtVGcTrkOn++xKncBhNoJKvOvAzvXn+hXp+RXOxO0
	o3LXmjHqdfsYvfVDbtpPy/Wab9LPCeBG4yDvhXJ4OprFCTXBaq0YPmPrWb
X-Received: by 2002:a05:6512:234b:b0:5a1:4518:f7cf with SMTP id 2adb3069b0e04-5a2ab925e75mr799391e87.21.1774607305216;
        Fri, 27 Mar 2026 03:28:25 -0700 (PDT)
Received: from ?IPV6:2001:9b1:ff:8d00:1382:d0f7:70e:137? ([2001:9b1:ff:8d00:1382:d0f7:70e:137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a0699504sm1258409e87.78.2026.03.27.03.28.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:28:24 -0700 (PDT)
Message-ID: <2a3ffd04-41ad-4590-9c89-ce0238b57156@norrbonn.se>
Date: Fri, 27 Mar 2026 11:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: buildpaths qa failures
From: Jonas Bonn <jonas@norrbonn.se>
To: OE-core <openembedded-core@lists.openembedded.org>
References: <ecc7b30a-e43a-4871-b8eb-f5c37f68adf0@norrbonn.se>
Content-Language: en-US
In-Reply-To: <ecc7b30a-e43a-4871-b8eb-f5c37f68adf0@norrbonn.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 10:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234078

Hi,

On 27/03/2026 09:39, Jonas Bonn wrote:
> Hi,
> 
> I've been getting a lot of these 'buildpaths' QA errors with wrynose. 
> This one, for example, is straight out of the core repository.
> 
> ERROR: which-2.23-r0 do_package_qa: QA Issue: File /usr/bin/.debug/ 
> which.which in package which-dbg contains reference to TMPDIR [buildpaths]
> ERROR: which-2.23-r0 do_package_qa: Fatal QA errors were found, failing 
> task.
> ERROR: Logfile of failure stored in: .../build/tmp/work/x86-64-v3-oe- 
> linux/which/2.23/temp/log.do_package_qa.2328176
> ERROR: Task (.../oe-core/meta/recipes-extended/which/ 
> which_2.23.bb:do_package_qa) failed with exit code '1'
> 
> At this point, I'm having trouble figuring out what is causing this.  I 
> thought it was related to 'meson' packages at first, but it occurs with 
> others, too; for example, unzip:
> 
> ERROR: unzip-1_6.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/ 
> funzip in package unzip-dbg contains reference to TMPDIR [buildpaths]
> ERROR: unzip-1_6.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug// 
> unzip.unzip in package unzip-dbg contains reference to TMPDIR [buildpaths]
> ERROR: unzip-1_6.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/ 
> unzipsfx in package unzip-dbg contains reference to TMPDIR [buildpaths]
> 
> It appears to be mostly with -dbg packages.  'objdump -s' on the files 
> definitely shows a single instance of the local path:
> 
>   0140 53006372 746e2e53 002f686f 6d652f6a  S.crtn.S./home/j
>   0150 6f6e6173 2fxxxxxx xxxxxxxx xxxxxxxx  onas/xxxxxxxxxxx
>   0160 xxxxxxxx xxxxxxxx xxxxxxxx 2f627569  xxxxxxxxxxxx/bui
>   0170 6c642f74 6d702f77 6f726b2f 7838362d  ld/tmp/work/x86-
>   0180 36342d76 332d6f65 2d6c696e 75782f75  64-v3-oe-linux/u
>   0190 6e7a6970 2f362e30 2f736f75 72636573  nzip/6.0/sources
>   01a0 2f756e7a 69703630 003c6172 74696669  /unzip60.<artifi
> 
> -ffile-prefix-map is being passed correctly during compilation and the 
> strings around the above culprit have been duly translated.
> 
> Is there any guidance to be had as to how to find the cause of this?  Is 
> this an artefact of my configuration and not reproducible by anyone else?

It appears to be related to LTO:

ERROR: kmod-34.2-r0 do_package_qa: QA Issue: File 
/usr/lib/.debug/libkmod.so.2.5.1 in package kmod-dbg contains reference 
to TMPDIR [buildpaths]
ERROR: kmod-34.2-r0 do_package_qa: QA Issue: File /usr/bin/.debug/kmod 
in package kmod-dbg contains reference to TMPDIR [buildpaths]

With reference to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109805 
the following fix is sufficient for kmod and a couple of other packages, 
but it introduces issues with some other packages (and does not fix the 
issue for unzip):

diff --git a/meta/conf/distro/include/lto.inc 
b/meta/conf/distro/include/lto.inc
index 8752249685..0a0b2b4cb1 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -52,4 +52,9 @@ LTO ?= "${LTO_DEFAULT}"
  SELECTED_OPTIMIZATION:append = 
"${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
  TARGET_LDFLAGS:append:class-target = 
"${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"

+TARGET_LDFLAGS:append:class-target = " 
-fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR}"

Thoughts?

/Jonas

