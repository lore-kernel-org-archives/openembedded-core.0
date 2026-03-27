Return-Path: <jonas@norrbonn.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8C510BA44C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:39:32 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68530.1774600767486404678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norrbonn-se.20230601.gappssmtp.com header.s=20230601 header.b=AjPpkgHy;
 spf=pass (domain: norrbonn.se, ip: 209.85.167.46, mailfrom: jonas@norrbonn.se)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a12c19affeso2928601e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20230601.gappssmtp.com; s=20230601; t=1774600765; x=1775205565; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7kLIgHzgrRx1Zm1FZ6e2E14/h39d8u8N+NyFU+6nxs=;
        b=AjPpkgHyYWyAK3zY2UCVBLd9c8BTKOVSvqVQ6sAwOAIMLGTpeYSJIrgzRHzdONSKAc
         k9AjP4GGe8jK0BjHy1hXAz7KZ84MZtTca1BVuhnHiFPnIstWqR1vjGO8LHVWuHtiDwvv
         FqZR6CJHpMKX7b2YH34Cuc35hWPbk0ijF9fgBAjki6HiBW88fNcuLSVguIy/I0B6jRA9
         HsuVvFZPTdxnQ4UtozsnqzQ69iEMjorSUn7BJljqUzxsAvvFEN/LsoYWfcNtgfjRSI5x
         vt4tKTwysO2YJRb9T48gwi2cN6Vcy3K61e1F5SIfsbS6P+eLE2bbXNUM7sLsS7syIK5F
         ESaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600765; x=1775205565;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7kLIgHzgrRx1Zm1FZ6e2E14/h39d8u8N+NyFU+6nxs=;
        b=h/jXDnmoM/1UcWDj6F6QfjihDQGzSAjo7AT0bwpFLeNvFN//cOZhsYfiZGJnVv8sLT
         mkzaG8ws9NBAWRTdMVGHHGfhoJuCwsk+JNwhxUEFX6pim14A69KbPzQkSxpepFkdTd5M
         ZsKFsxwG/rwTNtIBPaiiQ6WyJZyZBB+bpmNPri+0PDMLvcSjdVeFPiRgBQTNRd5ZoKaF
         tfYrWHBdzrrG7SZXxtISEIL+/AeZyPDk5NMGRw65bSI3W4kxRyPIUQNYZvagbzk8Vnq6
         DNO3wKyGMoQC9TSuJP+4O5WTFZRl0Ou/hgYnyR+1lhsqd9Hk/snhTLbVRxL255kzOzMX
         Zl3w==
X-Gm-Message-State: AOJu0YwNNqwDlcRXiqh1Cred+BTY6jVLEPiyqHxdQRv2GDRSAsY9dMnU
	dPpb+G22pwFXw+bMtiwYgAlCu34L/0Wjd4alN5kVJdFJGlcY0wT6XAo9cSYafrBjQOgmKZLx5nP
	Vn6hX
X-Gm-Gg: ATEYQzzubuYlJ38F+PyltegSTc5r3LIJa6s/EJbns3EzPlSiOM8oDfaFJkW6561HBNM
	Gh+gj9REkI3dhNXym4gJYydiICWt93rZGTfBmh0gujCns0vxF2uUq0RJy2+LfJ6Acbo9mwfY8UC
	UUlOZRJy0g1mLvrOxj/fYCYCoZqHvqdunOgN+SQaKsVBkx7FAWY1AYT5T6QuTjs4YLzyUhL1L4E
	ksxWKY6hiQcPqmt7qxalflMpVaiJOJP3lTbCDjsKx24r5ES2NxNHvwT95oJaUxecZyCjl00hM1X
	/NRR/Yhrh4gj7mJYcyK17g57G9LQ7kDxb5E8PGl/YN1ml02GCa2MD79G53a1rRF/6gp0vwzh4WA
	WQ/Opbl+GJTApeaHhAxsGXG37y6GKAJveIjuKT7x74Dz03phl/H+QYdUMyFcBHQkC3zqUzW7FWW
	6drR8sfTY+DEGGK0I+99K4kvELPMxitAk/3IwROH+lhZnd7ltorEnmOgSb
X-Received: by 2002:ac2:5205:0:b0:5a2:9b43:ba1f with SMTP id 2adb3069b0e04-5a2a5077c31mr1301693e87.12.1774600764423;
        Fri, 27 Mar 2026 01:39:24 -0700 (PDT)
Received: from ?IPV6:2001:9b1:ff:8d00:1382:d0f7:70e:137? ([2001:9b1:ff:8d00:1382:d0f7:70e:137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064507asm1210999e87.20.2026.03.27.01.39.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:39:24 -0700 (PDT)
Message-ID: <ecc7b30a-e43a-4871-b8eb-f5c37f68adf0@norrbonn.se>
Date: Fri, 27 Mar 2026 09:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jonas Bonn <jonas@norrbonn.se>
Subject: buildpaths qa failures
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234070

Hi,

I've been getting a lot of these 'buildpaths' QA errors with wrynose. 
This one, for example, is straight out of the core repository.

ERROR: which-2.23-r0 do_package_qa: QA Issue: File 
/usr/bin/.debug/which.which in package which-dbg contains reference to 
TMPDIR [buildpaths]
ERROR: which-2.23-r0 do_package_qa: Fatal QA errors were found, failing 
task.
ERROR: Logfile of failure stored in: 
.../build/tmp/work/x86-64-v3-oe-linux/which/2.23/temp/log.do_package_qa.2328176
ERROR: Task 
(.../oe-core/meta/recipes-extended/which/which_2.23.bb:do_package_qa) 
failed with exit code '1'

At this point, I'm having trouble figuring out what is causing this.  I 
thought it was related to 'meson' packages at first, but it occurs with 
others, too; for example, unzip:

ERROR: unzip-1_6.0-r0 do_package_qa: QA Issue: File 
/usr/bin/.debug/funzip in package unzip-dbg contains reference to TMPDIR 
[buildpaths]
ERROR: unzip-1_6.0-r0 do_package_qa: QA Issue: File 
/usr/bin/.debug//unzip.unzip in package unzip-dbg contains reference to 
TMPDIR [buildpaths]
ERROR: unzip-1_6.0-r0 do_package_qa: QA Issue: File 
/usr/bin/.debug/unzipsfx in package unzip-dbg contains reference to 
TMPDIR [buildpaths]

It appears to be mostly with -dbg packages.  'objdump -s' on the files 
definitely shows a single instance of the local path:

  0140 53006372 746e2e53 002f686f 6d652f6a  S.crtn.S./home/j
  0150 6f6e6173 2fxxxxxx xxxxxxxx xxxxxxxx  onas/xxxxxxxxxxx
  0160 xxxxxxxx xxxxxxxx xxxxxxxx 2f627569  xxxxxxxxxxxx/bui
  0170 6c642f74 6d702f77 6f726b2f 7838362d  ld/tmp/work/x86-
  0180 36342d76 332d6f65 2d6c696e 75782f75  64-v3-oe-linux/u
  0190 6e7a6970 2f362e30 2f736f75 72636573  nzip/6.0/sources
  01a0 2f756e7a 69703630 003c6172 74696669  /unzip60.<artifi

-ffile-prefix-map is being passed correctly during compilation and the 
strings around the above culprit have been duly translated.

Is there any guidance to be had as to how to find the cause of this?  Is 
this an artefact of my configuration and not reproducible by anyone else?

Thanks,
Jonas

