Return-Path: <ryan.harkin@linaro.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1BB60116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:30:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n11-v6so2818835wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=b1TD9oT+2Ua6aoex0o/CC2wQ1kRH5QnZqlbl5mKQDDs=;
	b=hS96m/Vjz/prL7jFVW2aafQnpF7Uwz4R7OI0GNngOuLXB+i3R72h1GqVj1+R2tXC0p
	ap4pFyzf+Co8fCzEwjaL39fewbyZrRfJJVYMlJ+gW+IlAn65Kfa3TTMmbf1o2/kBoq+g
	9nILMoSf34pSG3RSo5/ZMfdUwhBNXVo8Qi3L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b1TD9oT+2Ua6aoex0o/CC2wQ1kRH5QnZqlbl5mKQDDs=;
	b=QM2RsVhT9jDn663w72s1a32R1Dj6DWOvxbKnF1ZRurFNmlendW8ZtV0JoTAb8bHzO/
	vDbr/vVnt9ePgRfxmzFOSw+WxVkj0FRobCNqp/LB4RrvRqcjSzvKrMfYPw0rIt5Pq5V2
	00ObctUybsjgkFK/CzQAdYW5Q+I4fQpCbczB5Zrgsy0nnrcmQn0R0GsI3V7VpFEo6tNB
	61uvB5+6T1rFK4glWEGdq5mzi/sBmmNhJ+a0QnSBqL16GDP8jRvnhmYFS77sL0AwGVTV
	Ni1UaEU00Og16+S4eDSu8WhfRPLuvY5mh9kZrZLop+kgHoycrqgXxfs7qIW634uLw3A7
	yGxQ==
X-Gm-Message-State: APzg51Atv+u+NH7eR6ctLbvXE1YVhAO5MqhaWH7aFTQxrHMY9zT476mb
	4OZQA9JqDt50zXcgwmChpBrzN0Aaj0Q=
X-Google-Smtp-Source: ANB0VdZyF6Rk2MNOAqFwCKvJcy58Eteex0iKqaPamMq+shJqneIH3JWxdw1BDXo2L5QY07Mh/8oOAQ==
X-Received: by 2002:a1c:9e89:: with SMTP id
	h131-v6mr2692583wme.13.1534955448536; 
	Wed, 22 Aug 2018 09:30:48 -0700 (PDT)
Received: from localhost.localdomain (82-69-54-187.dsl.in-addr.zen.co.uk.
	[82.69.54.187]) by smtp.gmail.com with ESMTPSA id
	m8-v6sm2802229wrf.93.2018.08.22.09.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 09:30:47 -0700 (PDT)
From: Ryan Harkin <ryan.harkin@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:33 +0100
Message-Id: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: daiane.angolini@nxp.com, patches@linaro.org
Subject: [RFC 0/3] Adding BCM43430 NVRAM files
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
X-List-Received-Date: Wed, 22 Aug 2018 16:30:48 -0000

[Resending because I sent to the wrong email address for the oe-core
mailing list]

NVRAM files for the 43430 modules have been committed into the upstream
Linux firmware repo. I'd like to add these files into the linux-firmware
recipe.

The following files exist upstream on kernel.org:

- brcm/brcmfmac43430-sdio.AP6212.txt
- brcm/brcmfmac43430-sdio.MUR1DX.txt

The AP6212 and MUR1DX are the module types for variants of the 43430
chips.

The first patch is a simple update to the latest upstream. I guess
someone else will commit a similar change before I get to it, but for
now, I need to make the update to test my changes, so I thought I'd send
the patch with my RFC series.

The second patch adds both NVRAM files into a single new variable.
Ideally, the Linux kernel will be extended detect the module type, so
having all the NVRAM files in /lib/firmware/brcm seems like a sensible
thing to do. But advice here is appreciated. Perhaps I should have a
separate variable for each file and allow the machine config to choose
which configs to include in the filesystem, similar to how the .bin
files are included since Martin Jansa's change?

The 3rd patch is trickier, I think. At the moment, the Linux kernel
expects there to be only one NVRAM file, named brcmfmac43430-sdio.txt.
So to make the system "just work", it seems sensible to provide a way to
softlink the module specific NVRAM to the generic filename.

I'm trying to avoid each machine type having to define a softlink
_append in its own config. Many different machines can use the same
module type, for example.  I'm just not convinced that the way I've done
it is appropriate. eg. I don't like the usage of MACHINEOVERRIDE, or the
variable name I've chosen. I'd hoped to do it using a
MACHINE_EXTRA_RRECOMMENDS, but I'm not sure if that is possible. Again,
advice is appreciated.

Ryan Harkin (3):
  linux-firmware: upgrade to 1d17c18 revision
  linux-firmware: add BCM43430 nvram files
  linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM

 .../linux-firmware/linux-firmware_git.bb           | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.7.4


