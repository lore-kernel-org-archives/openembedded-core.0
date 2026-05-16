Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F5ACD4F25
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 06:56:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1849.1778914607257335647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 23:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Md1iFLYI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so5810105e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778914605; x=1779519405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBMDeavqdFjWzCJVTdTgEo54YRIHRv0RgBknRfEaI+0=;
        b=Md1iFLYI3T7QNRfcnE8p6Zb7rUeV5FvkisC9x453PVE7p0mSBvBHfzitoXSdwOVOG8
         //ykuB/09Vl1o6xLhSyafUwtuXrDspHjcC73l5zYJLu8wXWZcW3Pc6CFZp/M7d+d7O5z
         Ei2Rhmw7RCBWqpsT2hwKGFEy+VPlB1Njj4n3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778914605; x=1779519405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBMDeavqdFjWzCJVTdTgEo54YRIHRv0RgBknRfEaI+0=;
        b=KKCXJ64ZndtWFLjDwY5tdUYrbMaA6m+UPRJjrVpCA9hWsSPODh/mh1qh5K8dgfMTH3
         /YcuMagZusGs6lWqdb2gZsjmt2dDiC6NFcSoO1V04J3Bs5RFhZHOboXtSwz+tbLo6gLV
         WajpBRuYAHeA1wZK1/pyUkfndQOu9UXrNPp4COa6E2qpt2hbSiVjdD3X7I8EJ33esMOs
         RXgJd5un3+lBtECLfRqmt38zTs20UXvBIl7dmqVhvKz4Xw0qbQbmfKRa3GSWfCgL6c/h
         O1PeKSyHMkHsWUmwW7WC64StF4DfQVGd3eunonfFxEB8SN2N2ZvFU4kkAuemyZt+EN8Y
         oSTg==
X-Gm-Message-State: AOJu0YyK1HPgR139IJogbzsDXUghkeHNBydXaxj/ZVnFzXtgiIpCiIpt
	XTQDF7FVm9As10xJCcqnlXwmCBFth4dMEusnmtVmfChv9pOS93ysATc1+GrakhiR/RDBBHctM2J
	Ucb9V
X-Gm-Gg: Acq92OG47Hn2ikxLUO9uE8Lt7N9zx+xf8yBggUehs7PC/WUKrgbLMrRDHmgiQlXDD8g
	HW9yWPyfWr43oUUcv7ClVikkOpWXG4VgH6L+UXq3hqcFoGNrGP4o6WYnaLSxcOsbc6msJGtLjrK
	uBT8rbZaD3OHXe35pcxYycOWnJfMaxVemvdsFQ+KRgoCy7q3ZiOmJ8niIlK0wMde7020BQ2W4BE
	kzQrNzgQ+oBt/Zi+sG5MaCTtcacgeeuRraGsrWJUZt61aIwOczY9TmPyeRQSw+styMyYH+48Rd0
	dXtgcVbWkXrBgcmZAKnSei/ApGkhN21mCvU6n/vomDbcW+xBaUn27QpN4+8WAe+3lX9gkVJNV0s
	z3k4u9jPNHXqlYx9/05+oLhpT4KaGZvBFuAfikdMJA48VWkOaYvfZ6zzBFnrVu4eZM1sPG3KLNX
	7t33xWN0MYMue6w5kdzd8bjDOoYkHmqKoZJHmvM+li/THUDqDhQ4k=
X-Received: by 2002:a05:600c:34ca:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48fe60ee4c7mr102045355e9.14.1778914602273;
        Fri, 15 May 2026 23:56:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:352c:7135:a073:c09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf0eae0sm32350715e9.10.2026.05.15.23.56.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:56:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] licenses: Update with the pull-sdpx-licenses.py script to 3.28.0
Date: Sat, 16 May 2026 07:56:36 +0100
Message-ID: <20260516065639.4192204-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 May 2026 06:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237185

Run the update script to update our licenses to version 3.28.0 which
adds 28 new licenses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../common-licenses/ALGLIB-Documentation      |   17 +
 .../Advanced-Cryptics-Dictionary              |   10 +
 meta/files/common-licenses/BOLA-1.1           |   27 +
 meta/files/common-licenses/BSD-3-Clause-Tso   |   11 +
 .../common-licenses/BSD-Mark-Modifications    |   35 +
 meta/files/common-licenses/Buddy              |   26 +
 meta/files/common-licenses/CAPEC-tou          |    7 +
 .../common-licenses/ESA-PL-permissive-2.4     |  240 +++
 .../ESA-PL-strong-copyleft-2.4                |  200 ++
 .../common-licenses/ESA-PL-weak-copyleft-2.4  |  193 ++
 meta/files/common-licenses/HPND-SMC           |   15 +
 .../HPND-sell-variant-critical-systems        |   20 +
 meta/files/common-licenses/ISO-permission     |    4 +
 meta/files/common-licenses/MIT-STK            |   27 +
 meta/files/common-licenses/MMPL-1.0.1         |   87 +
 meta/files/common-licenses/NIST-PD-TNT        |    3 +
 meta/files/common-licenses/OSC-1.0            |   11 +
 meta/files/common-licenses/OSSP               |   26 +
 meta/files/common-licenses/OpenMDW-1.0        |   49 +
 .../common-licenses/ParaType-Free-Font-1.3    |   24 +
 meta/files/common-licenses/SGMLUG-PM          |   43 +
 meta/files/common-licenses/TekHVC             |   34 +
 meta/files/common-licenses/UnRAR              |   41 +
 meta/files/common-licenses/Vixie-Cron         |    4 +
 meta/files/common-licenses/WTFNMFPL           |   17 +
 meta/files/common-licenses/WordNet            |   12 +
 .../common-licenses/X11-no-permit-persons     |   23 +
 meta/files/common-licenses/hyphen-bulgarian   |    8 +
 meta/files/spdx-licenses.json                 | 1758 ++++++++++-------
 29 files changed, 2267 insertions(+), 705 deletions(-)
 create mode 100644 meta/files/common-licenses/ALGLIB-Documentation
 create mode 100644 meta/files/common-licenses/Advanced-Cryptics-Dictionary
 create mode 100644 meta/files/common-licenses/BOLA-1.1
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Tso
 create mode 100644 meta/files/common-licenses/BSD-Mark-Modifications
 create mode 100644 meta/files/common-licenses/Buddy
 create mode 100644 meta/files/common-licenses/CAPEC-tou
 create mode 100644 meta/files/common-licenses/ESA-PL-permissive-2.4
 create mode 100644 meta/files/common-licenses/ESA-PL-strong-copyleft-2.4
 create mode 100644 meta/files/common-licenses/ESA-PL-weak-copyleft-2.4
 create mode 100644 meta/files/common-licenses/HPND-SMC
 create mode 100644 meta/files/common-licenses/HPND-sell-variant-critical-systems
 create mode 100644 meta/files/common-licenses/ISO-permission
 create mode 100644 meta/files/common-licenses/MIT-STK
 create mode 100644 meta/files/common-licenses/MMPL-1.0.1
 create mode 100644 meta/files/common-licenses/NIST-PD-TNT
 create mode 100644 meta/files/common-licenses/OSC-1.0
 create mode 100644 meta/files/common-licenses/OSSP
 create mode 100644 meta/files/common-licenses/OpenMDW-1.0
 create mode 100644 meta/files/common-licenses/ParaType-Free-Font-1.3
 create mode 100644 meta/files/common-licenses/SGMLUG-PM
 create mode 100644 meta/files/common-licenses/TekHVC
 create mode 100644 meta/files/common-licenses/UnRAR
 create mode 100644 meta/files/common-licenses/Vixie-Cron
 create mode 100644 meta/files/common-licenses/WTFNMFPL
 create mode 100644 meta/files/common-licenses/WordNet
 create mode 100644 meta/files/common-licenses/X11-no-permit-persons
 create mode 100644 meta/files/common-licenses/hyphen-bulgarian

diff --git a/meta/files/common-licenses/ALGLIB-Documentation b/meta/files/common-licenses/ALGLIB-Documentation
new file mode 100644
index 00000000000..6b966d4b413
--- /dev/null
+++ b/meta/files/common-licenses/ALGLIB-Documentation
@@ -0,0 +1,17 @@
+ Copyright 1994-2009 Sergey Bochkanov, ALGLIB Project. All rights reserved.
+
+Redistribution and use of this document (ALGLIB Reference Manual) with or
+without modification, are permitted provided that such redistributions will
+retain the above copyright notice, this condition and the following disclaimer
+as the first (or last) lines of this file.
+
+THIS DOCUMENTATION IS PROVIDED BY THE ALGLIB PROJECT "AS IS" AND ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
+SHALL THE ALGLIB PROJECT BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
+BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
+IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS DOCUMENTATION, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Advanced-Cryptics-Dictionary b/meta/files/common-licenses/Advanced-Cryptics-Dictionary
new file mode 100644
index 00000000000..904b942ae61
--- /dev/null
+++ b/meta/files/common-licenses/Advanced-Cryptics-Dictionary
@@ -0,0 +1,10 @@
+License text: Copyright (c) J Ross Beresford 1993-1999. All Rights Reserved.
+
+The following restriction is placed on the use of this publication:
+if The UK Advanced Cryptics Dictionary is used in a software package
+or redistributed in any form, the copyright notice must be
+prominently displayed and the text of this document must be included
+verbatim.
+
+There are no other restrictions: I would like to see the list
+distributed as widely as possible.
diff --git a/meta/files/common-licenses/BOLA-1.1 b/meta/files/common-licenses/BOLA-1.1
new file mode 100644
index 00000000000..4b305a6493e
--- /dev/null
+++ b/meta/files/common-licenses/BOLA-1.1
@@ -0,0 +1,27 @@
+I don't like licenses, because I don't like having to worry about all this
+legal stuff just for a simple piece of software I don't really mind anyone
+using. But I also believe that it's important that people share and give back;
+so I'm placing this work under the following license.
+
+
+BOLA - Buena Onda License Agreement (v1.1)
+------------------------------------------
+
+This work is provided 'as-is', without any express or implied warranty. In no
+event will the authors be held liable for any damages arising from the use of
+this work.
+
+To all effects and purposes, this work is to be considered Public Domain.
+
+
+However, if you want to be "buena onda", you should:
+
+1. Not take credit for it, and give proper recognition to the authors.
+2. Share your modifications, so everybody benefits from them.
+3. Do something nice for the authors.
+4. Help someone who needs it: sign up for some volunteer work or help your
+   neighbour paint the house.
+5. Don't waste. Anything, but specially energy that comes from natural
+   non-renewable resources. Extra points if you discover or invent something
+   to replace them.
+6. Be tolerant. Everything that's good in nature comes from cooperation.
diff --git a/meta/files/common-licenses/BSD-3-Clause-Tso b/meta/files/common-licenses/BSD-3-Clause-Tso
new file mode 100644
index 00000000000..3f70dabf394
--- /dev/null
+++ b/meta/files/common-licenses/BSD-3-Clause-Tso
@@ -0,0 +1,11 @@
+Copyright Theodore Ts'o, 1994, 1995, 1996, 1997, 1998, 1999. All rights reserved.
+
+Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice, and the entire permission notice in its entirety, including the disclaimer of warranties.
+
+2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
+
+3. The name of the author may not be used to endorse or promote products derived from this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ALL OF WHICH ARE HEREBY DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF NOT ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/BSD-Mark-Modifications b/meta/files/common-licenses/BSD-Mark-Modifications
new file mode 100644
index 00000000000..995bcb1eb90
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Mark-Modifications
@@ -0,0 +1,35 @@
+License text:  Copyright 1993, Geoff Kuenning, Granada Hills, CA
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+notice, this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright
+notice, this list of conditions and the following disclaimer in the
+documentation and/or other materials provided with the distribution.
+
+3. All modifications to the source code must be clearly marked as
+such.  Binary redistributions based on modified source code
+must be clearly marked as modified versions in the documentation
+and/or other materials provided with the distribution.
+(clause 4 removed with permission from Geoff Kuenning)
+
+4. The name of Geoff Kuenning may not be used to endorse or promote
+products derived from this software without specific prior
+written permission.
+
+THIS SOFTWARE IS PROVIDED BY GEOFF KUENNING AND CONTRIBUTORS ``AS IS'' AND
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.  IN NO EVENT SHALL GEOFF KUENNING OR CONTRIBUTORS BE LIABLE
+FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Buddy b/meta/files/common-licenses/Buddy
new file mode 100644
index 00000000000..fe750b2e326
--- /dev/null
+++ b/meta/files/common-licenses/Buddy
@@ -0,0 +1,26 @@
+           Copyright (C) 1996-2002 by Jorn Lind-Nielsen
+                        All rights reserved
+
+Permission is hereby granted, without written agreement and without
+license or royalty fees, to use, reproduce, prepare derivative
+works, distribute, and display this software and its documentation
+for any purpose, provided that (1) the above copyright notice and
+the following two paragraphs appear in all copies of the source code
+and (2) redistributions, including without limitation binaries,
+reproduce these notices in the supporting documentation. Substantial
+modifications to this software may be copyrighted by their authors
+and need not follow the licensing terms described here, provided
+that the new terms are clearly indicated in all files where they apply.
+
+IN NO EVENT SHALL JORN LIND-NIELSEN, OR DISTRIBUTORS OF THIS
+SOFTWARE BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
+INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS
+SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE AUTHORS OR ANY OF THE
+ABOVE PARTIES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+JORN LIND-NIELSEN SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS
+ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE NO
+OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
+MODIFICATIONS.
diff --git a/meta/files/common-licenses/CAPEC-tou b/meta/files/common-licenses/CAPEC-tou
new file mode 100644
index 00000000000..ea2a3f78cff
--- /dev/null
+++ b/meta/files/common-licenses/CAPEC-tou
@@ -0,0 +1,7 @@
+LICENSE
+The MITRE Corporation (MITRE) hereby grants you a non-exclusive, royalty-free license to use Common Attack Pattern Enumeration and Classification (CAPEC™) for research, development, and commercial purposes. Any copy you make for such purposes is authorized provided that you reproduce MITRE’s copyright designation and this license in any such copy.
+
+DISCLAIMERS
+
+ALL DOCUMENTS AND THE INFORMATION CONTAINED THEREIN ARE PROVIDED ON AN "AS IS" BASIS AND THE CONTRIBUTOR, THE ORGANIZATION HE/SHE REPRESENTS OR IS SPONSORED BY (IF ANY), THE MITRE CORPORATION, ITS BOARD OF TRUSTEES, OFFICERS, AGENTS, AND EMPLOYEES, DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION THEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
+
diff --git a/meta/files/common-licenses/ESA-PL-permissive-2.4 b/meta/files/common-licenses/ESA-PL-permissive-2.4
new file mode 100644
index 00000000000..5e25adc372c
--- /dev/null
+++ b/meta/files/common-licenses/ESA-PL-permissive-2.4
@@ -0,0 +1,240 @@
+European Space Agency Public License (ESA-PL) Permissive (Type 3) – v2.4
+
+
+
+1 Definitions
+
+
+
+1.1 “Contributor” means (a) the individual or legal entity that originally creates or later modifies the Software and (b) each subsequent individual or legal entity that creates or contributes to the creation of Modifications.
+
+
+
+1.2 “Contributor Version” means the version of the Software on which the Contributor based its Modifications.
+
+
+
+1.3 “Distribution” and “Distribute” means any act of selling, giving, lending, renting, distributing, communicating, transmitting, or otherwise making available, physically or electronically or by any other means, copies of the Software or Modifications.
+
+
+
+1.4 “ESA” means the European Space Agency.
+
+
+
+1.5 “License” means this document.
+
+
+
+1.6 “Licensor” means the individual or legal entity that Distributes the Software under the License to You.
+
+
+
+1.7 “Modification” means any work or software created that is based upon or derived from the Software (or portions thereof) or a modification of the Software (or portions thereof). For the avoidance of doubt, linking a library to the Software results in a Modification.
+
+
+
+1.8 “Object Code” means any non-Source Code form of the Software and/or Modifications.
+
+
+
+1.9 “Patent Claims” (of a Contributor) means any patent claim(s), owned at the time of the Distribution or subsequently acquired, including without limitation, method, process and apparatus claims, in any patent licensable by a Contributor which would be infringed by making use of the rights granted under Sec. 2.1, including but not limited to make, have made, use, sell, offer for sale or import of the Contributor Version and/or such Contributor’s Modifications (if any), either alone or in combination with the Contributor Version. “Licensable” means having the right to grant, whether at the time of the Distribution or subsequently acquired, the rights conveyed herein.
+
+
+
+1.10 “Software” means the software Distributed under this License by the Licensor, in Source Code and/or Object Code form.
+
+
+
+1.11 “Source Code” means the preferred, usually human readable form of the Software and/or Modifications in which modifications are made and the associated documentation included in or with such code.
+
+
+
+1.12 “You” means an individual or legal entity exercising rights under this License (the licensee).
+
+
+
+2 Grant of Rights
+
+
+
+2.1 Copyright
+
+
+
+The Licensor, and each Contributor in respect of such Contributor’s Modifications, hereby grants You a world-wide, royalty-free, non-exclusive license under Copyright, subject to the terms and conditions of this License, to:
+
+·      use the Software;
+
+·      reproduce the Software by any or all means and in any or all form;
+
+·      Modify the Software and create works based on the Software;
+
+·      communicate to the public, including making available, display or perform the Software or copies thereof to the public;
+
+·      Distribute, sublicense, lend and rent the Software.
+
+
+
+The license grant is perpetual and irrevocable, unless terminated pursuant to Sec. 8.
+
+
+
+2.2 Patents
+
+
+
+Each Contributor in respect of such Contributor’s Modifications, hereby grants You a world-wide, royalty-free, non-exclusive, sub-licensable license under Patent Claims to the extent necessary to make use of the rights granted under Sec. 2.1, including but not limited to make, have made, use, sell, offer for sale, import, export and Distribute such Contributor’s Modifications and the combination of such Contributor’s Modifications with the Contributor Version (collectively called the “Patent Licensed Version” of the Software).
+
+
+
+No patent license is granted for claims that are infringed:
+
+·      only as a consequence of further modification of the Patent Licensed Version; or
+
+·      by the combination of the Patent Licensed Version with other software or other devices or hardware, unless such combination was an intended use case of the Patent Licensed Version (e.g. a general purpose library is intended to be used with other software, a satellite navigation software is intended to be used with appropriate hardware); or
+
+·      by a Modification under Patent Claims in the absence of the Contributor’s Modifications or by a combination of the Contributor’s Modifications with software other than the Patent Licensed Version or Modifications thereof.
+
+
+
+2.3 Trademark
+
+
+
+This License does not grant permission to use trade names, trademarks, services marks, logos or names of the Licensor, except as required for reasonable and customary use in describing the origin of the Software and as reasonable necessary to comply with the obligations of this License (e.g. by reproducing the content of the notices). For the avoidance of doubt, upon Distribution of Modifications You must not use the Licensor’s or ESA’s trademarks, names or logos in any way that states or implies, or can be interpreted as stating or implying, that the final product is endorsed or created by the Licensor or ESA.
+
+
+
+3 Distribution
+
+
+
+3.1 No Copyleft
+
+
+
+You may Distribute the Software and/or Modifications, as Source Code or Object Code, under any license terms, provided that
+
+(a)  notice is given of the use of the Software and the applicability of this License to the Software; and
+
+(b) You make best efforts to ensure that further Distribution of the Software and/or Modifications (including further Modifications) is subject to the obligations set forth in this Sec. 3.1 (a) and (b).
+
+
+
+4 Notices
+
+
+
+The following obligations apply in the event of any Distribution of the Software and/or Modifications as Source Code and/or Object Code:
+
+
+
+4.1 You must include a copy of this License and all of the notices set out in this Sec. 4.
+
+
+
+4.2 You may not remove or alter any copyright, patent, trademark and attribution notices nor any of the notices set out in this Sec. 4, except as necessary for your compliance with this License or otherwise permitted by this License, except for those notices that do not pertain to the Modifications You Distribute.
+
+
+
+4.3 Each Contributor must cause its Modification carrying prominent notices stating that the Software has been modified and the date of modification and identify itself as the originator of its Modifications in a manner that reasonably allows identification and contact with the Contributor. The aforementioned notices must at a minimum be in a text file included with the Distribution titled “CHANGELOG”.
+
+
+
+4.4 The Software may include a "NOTICE" text file containing general notices. Any Contributor can create such a NOTICE file or add notices to it, alongside or as an addendum to the original text, provided that such notices cannot be construed as modifying the License.
+
+
+
+4.5 Each Contributor must identify all of its Patent Claims by providing at a minimum the patent number and identification and contact information in a text file included with the Distribution titled "LEGAL".
+
+
+
+5 Warranty and Liability
+
+
+
+5.1 Each Contributor warrants and represents that it has sufficient rights to grant the rights to its Modifications conveyed by this License.
+
+
+
+5.2 Except as expressly set forth in this License, the Software is provided to You on an “as is” basis and without warranties of any kind, including without limitation merchantability, fitness for a particular purpose, absence of defects or errors, accuracy or non-infringement of intellectual property rights. Mandatory statutory warranty claims, e.g. in the event of wilful deception or fraudulent misrepresentation, shall remain unaffected.
+
+
+
+5.3 Except as expressly set forth in this License, neither Licensor nor any Contributor shall be liable, including, without limitation, for direct, indirect, incidental, or consequential damages (including without limitation loss of profit), however caused and on any theory of liability, arising in any way out of the use or Distribution of the Software or the exercise of any rights under this License, even if You have been advised of the possibility of such damages. Mandatory statutory liability claims, e.g. in the event of wilful misconduct, wilful deception or fraudulent misrepresentation, shall remain unaffected.
+
+
+
+6 Additional Agreements
+
+
+
+While Distributing the Software or Modifications, You may choose to conclude additional agreements, for free or for charge, regarding for example support, warranty, indemnity, liability or liability obligations and/or rights, provided such additional agreements are consistent with this License and do not effectively restrict the recipient’s rights under this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor or Licensor, and only if You agree to indemnify, defend, and hold each Contributor or Licensor harmless for any liability incurred by, or claims asserted against, such Contributor or Licensor by reason of your accepting any such warranty or additional liability.
+
+
+
+7 Infringements
+
+
+
+You acknowledge that continuing to use the Software knowing that such use infringes third party rights (e.g. after receiving a third party notification of infringement) would expose you to the risk of being considered as intentionally infringing third party rights. In such event You should acquire the respective rights or modify the Software so that the Modification is non-infringing.
+
+
+
+8 Termination
+
+
+
+8.1 This License and the rights granted hereunder will terminate automatically upon any breach by You with the terms of this License if you fail to cure such breach within 30 days of becoming aware of the breach.
+
+
+
+8.2 If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Software constitutes direct or contributory patent infringement, then any patent and copyright licenses granted to You under this License for the Software shall terminate as of the date such litigation is filed.
+
+
+
+8.3 Any licenses validly granted by You under the License prior to termination shall continue and survive termination.
+
+
+
+9 Applicable Law, Arbitration and Compliance
+
+
+
+9.1 This License is governed by the laws of the ESA Member State where the Licensor resides or has his registered office. “Member States” are the members of the European Space Agency pursuant to Art. 1 of the ESA Convention[1]. This licence shall be governed by German law if a dispute arises with the ESA as a Licensor or if the Licensor has no residence or registered office inside a Member State.
+
+
+
+9.2 Any dispute arising out of this License shall be finally settled in accordance with the Rules of Arbitration of the International Chamber of Commerce by one or more arbitrators designated in conformity with those rules. Arbitration proceedings shall take place in Cologne, Germany. The award shall be final and binding on the parties, no appeal shall lie against it. The enforcement of the award shall be governed by the rules of procedure in force in the state/country in which it is to be executed.
+
+
+
+9.3 For the avoidance of doubt, You are solely responsible for compliance with current applicable requirements of national laws. The Software can be subject to export control laws. If You export the Software it is your responsibility to comply with all export control laws. This may include different requirements, as e.g. registering the Software with the local authorities.
+
+
+
+9.4 If it is impossible for You to comply with any of the terms of this License due to statute, judicial order or regulation You must:
+
+(a)  comply with the terms of this License to the maximum extent possible; and
+
+(b) describe the limitations and the Object Code and/or Source Code they affect. Such description must be included in the LEGAL notice described in Section 4. Except to the extent prohibited by statute or regulation, such description must be sufficiently detailed for an average recipient to be able to understand it.
+
+
+
+10 Miscellaneous
+
+
+
+10.1 Only ESA has the right to modify or publish new versions of this License. ESA may assign this right to other individuals or legal entities. Each version will be given a distinguishing version number.
+
+
+
+10.2 This License represents the complete agreement concerning subject matter hereof.
+
+
+
+10.3 If any provision of this License is held invalid or unenforceable, the remaining provisions of this License shall not be affected. The invalid or unenforceable provision shall be construed and/or reformed to the extent necessary to make it enforceable and valid.
+
+
+[1] As of January 2020 the Member States are Austria, Belgium, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Hungary, Ireland, Italy, Luxembourg, The Netherlands, Norway, Poland, Portugal, Romania, Slovenia, Spain, Sweden, Switzerland and the United Kingdom.
diff --git a/meta/files/common-licenses/ESA-PL-strong-copyleft-2.4 b/meta/files/common-licenses/ESA-PL-strong-copyleft-2.4
new file mode 100644
index 00000000000..a0078986573
--- /dev/null
+++ b/meta/files/common-licenses/ESA-PL-strong-copyleft-2.4
@@ -0,0 +1,200 @@
+European Space Agency Public License (ESA-PL) Strong Copyleft (Type 1) – v2.4
+
+
+
+1 Definitions
+
+
+
+1.1 “Contributor” means (a) the individual or legal entity that originally creates or later modifies the Software and (b) each subsequent individual or legal entity that creates or contributes to the creation of Modifications.
+
+1.2 “Contributor Version” means the version of the Software on which the Contributor based its Modifications.
+
+1.3 “Distribution” and “Distribute” means any act of selling, giving, lending, renting, distributing, communicating, transmitting, or otherwise making available, physically or electronically or by any other means, copies of the Software or Modifications.
+
+1.4 “ESA” means the European Space Agency.
+
+1.5 “License” means this document.
+
+1.6 “Licensor” means the individual or legal entity that Distributes the Software under the License to You.
+
+1.7 “Modification” means any work or software created that is based upon or derived from the Software (or portions thereof) or a modification of the Software (or portions thereof). For the avoidance of doubt, linking a library to the Software results in a Modification.
+
+1.8 “Object Code” means any non-Source Code form of the Software and/or Modifications.
+
+1.9 “Patent Claims” (of a Contributor) means any patent claim(s), owned at the time of the Distribution or subsequently acquired, including without limitation, method, process and apparatus claims, in any patent licensable by a Contributor which would be infringed by making use of the rights granted under Sec. 2.1, including but not limited to make, have made, use, sell, offer for sale or import of the Contributor Version and/or such Contributor’s Modifications (if any), either alone or in combination with the Contributor Version. “Licensable” means having the right to grant, whether at the time of the Distribution or subsequently acquired, the rights conveyed herein.
+
+1.10 “Software” means the software Distributed under this License by the Licensor, in Source Code and/or Object Code form.
+
+1.11 “Source Code” means the preferred, usually human readable form of the Software and/or Modifications in which modifications are made and the associated documentation included in or with such code.
+
+1.12 “You” means an individual or legal entity exercising rights under this License (the licensee).
+
+
+
+2 Grant of Rights
+
+
+
+2.1 Copyright
+
+The Licensor, and each Contributor in respect of such Contributor’s Modifications, hereby grants You a world-wide, royalty-free, non-exclusive license under Copyright, subject to the terms and conditions of this License, to:
+
+- use the Software;
+- reproduce the Software by any or all means and in any or all form;
+- Modify the Software and create works based on the Software;
+- communicate to the public, including making available, display or perform the Software or copies thereof to the public;
+- Distribute, sublicense, lend and rent the Software.
+
+
+The license grant is perpetual and irrevocable, unless terminated pursuant to Sec. 8.
+
+
+
+2.2 Patents
+
+Each Contributor in respect of such Contributor’s Modifications, hereby grants You a world-wide, royalty-free, non-exclusive, sub-licensable license under Patent Claims to the extent necessary to make use of the rights granted under Sec. 2.1, including but not limited to make, have made, use, sell, offer for sale, import, export and Distribute such Contributor’s Modifications and the combination of such Contributor’s Modifications with the Contributor Version (collectively called the “Patent Licensed Version” of the Software).
+
+
+
+No patent license is granted for claims that are infringed:
+
+- only as a consequence of further modification of the Patent Licensed Version; or
+- by the combination of the Patent Licensed Version with other software or other devices or hardware, unless such combination was an intended use case of the Patent Licensed Version (e.g. a general purpose library is intended to be used with other software, a satellite navigation software is intended to be used with appropriate hardware); or
+- by a Modification under Patent Claims in the absence of the Contributor’s Modifications or by a combination of the Contributor’s Modifications with software other than the Patent Licensed Version or Modifications thereof.
+
+
+2.3 Trademark
+
+This License does not grant permission to use trade names, trademarks, services marks, logos or names of the Licensor, except as required for reasonable and customary use in describing the origin of the Software and as reasonable necessary to comply with the obligations of this License (e.g. by reproducing the content of the notices). For the avoidance of doubt, upon Distribution of Modifications You must not use the Licensor’s or ESA’s trademarks, names or logos in any way that states or implies, or can be interpreted as stating or implying, that the final product is endorsed or created by the Licensor or ESA.
+
+
+
+3 Distribution
+
+
+
+3.1 Copyleft Clause
+
+All Distribution of the Software and/or Modifications, as Source Code or Object Code, must be, as a whole, either under (a) the terms of this License or (b) any later version of this License unless the Software is expressly Distributed only under a specific version of the License by a Contributor.
+
+
+
+3.2 Copyleft exceptions
+
+3.2.1 Compilations. In the event of the Distribution of a compilation of Software and/or Modifications with other separate and independent works (for example in or on a volume of a storage or distribution medium), which are not by their nature extensions or other modifications of the Software and/or the Modifications, and which are not combined with it such as to form a larger program, Distribution of the compilation does not cause this License to apply to the other parts of the compilation.
+
+3.2.2 System Libraries. System Libraries used by a Modification need not be Distributed under the terms of this License and need not be included as part of the Source Code pursuant to Sec. 3.3. “System Library” means anything that is normally distributed (in either source or binary form) with the major components (kernel, window system etc.) of the operating system(s) on which the Software or Modification runs, or a compiler used to produce the Object Code, or an object code interpreter used to run it.
+
+3.2.3 External Modules. You may create a Modification by combining Software with an external module enabling supplementary functions or services and Distribute the external module under different license terms, provided that the external module and the Software run in separate address spaces, with one calling the other, or each other interfacing, when they are run.
+
+
+
+3.3 Communication of the Source Code
+
+If You Distribute the Software and/or Modifications as Object Code, You must:
+
+provide in addition a copy of the Source Code of the Software and/or Modifications to each recipient; or
+make the Source Code of the Software and/or Modifications freely accessible by reasonable means for anyone who possesses the Object Code or received the Software and/or Modifications from You, and inform recipients how to obtain a copy of the Source Code. Such information needs to be included at a minimum in the “NOTICE” file pursuant to Sec. 4.4 You are obliged to make the Source Code accessible in accordance with this Section for as long as You continue to Distribute the Software and/or Modifications and at a minimum for a three year period following Your last Distribution of the Software and/or Modifications.
+
+
+3.4 Service Provision
+
+If You provide access to the Software and/or Modifications or make its functionality available by any means or use it to provide services for any individual or legal entity other than You, e.g. by provision of software-as-a-service, You are obliged to make  the Source Code of the Software and/or Modifications freely accessible by reasonable means to those individuals or legal entities and provide information on how to obtain a copy of the Source Code. You are obliged to make the Source Code accessible in accordance with this Section for as long as You continue to provide access to the Software and/or Modifications.
+
+
+
+3.5 Dual Licensing
+
+This License gives no permission to license the Software or Modifications in any other way, but it does not invalidate such permission if You have separately received it.
+
+
+
+4 Notices
+
+The following obligations apply in the event of any Distribution of the Software and/or Modifications as Source Code and/or Object Code:
+
+
+
+4.1 You must include a copy of this License and all of the notices set out in this Sec. 4.
+
+4.2 You may not remove or alter any copyright, patent, trademark and attribution notices nor any of the notices set out in this Sec. 4, except as necessary for your compliance with this License or otherwise permitted by this License, except for those notices that do not pertain to the Modifications You Distribute.
+
+4.3 Each Contributor must cause its Modification carrying prominent notices stating that the Software has been modified and the date of modification and identify itself as the originator of its Modifications in a manner that reasonably allows identification and contact with the Contributor. The aforementioned notices must at a minimum be in a text file included with the Distribution titled “CHANGELOG”.
+
+4.4 The Software may include a "NOTICE" text file containing general notices. Any Contributor can create such a NOTICE file or add notices to it, alongside or as an addendum to the original text, provided that such notices cannot be construed as modifying the License.
+
+4.5 Each Contributor must identify all of its Patent Claims by providing at a minimum the patent number and identification and contact information in a text file included with the Distribution titled "LEGAL".
+
+
+
+5 Warranty and Liability
+
+
+
+5.1 Each Contributor warrants and represents that it has sufficient rights to grant the rights to its Modifications conveyed by this License.
+
+5.2 Except as expressly set forth in this License, the Software is provided to You on an “as is” basis and without warranties of any kind, including without limitation merchantability, fitness for a particular purpose, absence of defects or errors, accuracy or non-infringement of intellectual property rights. Mandatory statutory warranty claims, e.g. in the event of wilful deception or fraudulent misrepresentation, shall remain unaffected.
+
+5.3 Except as expressly set forth in this License, neither Licensor nor any Contributor shall be liable, including, without limitation, for direct, indirect, incidental, or consequential damages (including without limitation loss of profit), however caused and on any theory of liability, arising in any way out of the use or Distribution of the Software or the exercise of any rights under this License, even if You have been advised of the possibility of such damages. Mandatory statutory liability claims, e.g. in the event of wilful misconduct, wilful deception or fraudulent misrepresentation, shall remain unaffected.
+
+
+
+6 Additional Agreements
+
+
+
+While Distributing the Software or Modifications, You may choose to conclude additional agreements, for free or for charge, regarding for example support, warranty, indemnity, liability or liability obligations and/or rights, provided such additional agreements are consistent with this License and do not effectively restrict the recipient’s rights under this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor or Licensor, and only if You agree to indemnify, defend, and hold each Contributor or Licensor harmless for any liability incurred by, or claims asserted against, such Contributor or Licensor by reason of your accepting any such warranty or additional liability.
+
+
+
+7 Infringements
+
+
+
+7.1 You acknowledge that continuing to use the Software knowing that such use infringes third party rights (e.g. after receiving a third party notification of infringement) would expose you to the risk of being considered as intentionally infringing third party rights. In such event You should acquire the respective rights or modify the Software so that the Modification is non-infringing.
+
+
+
+8 Termination
+
+
+
+8.1 This License and the rights granted hereunder will terminate automatically upon any breach by You with the terms of this License if you fail to cure such breach within 30 days of becoming aware of the breach.
+
+8.2 If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Software constitutes direct or contributory patent infringement, then any patent and copyright licenses granted to You under this License for the Software shall terminate as of the date such litigation is filed.
+
+8.3 Any licenses validly granted by You under the License prior to termination shall continue and survive termination.
+
+
+
+9 Applicable Law, Arbitration and Compliance
+
+
+
+9.1 This License is governed by the laws of the ESA Member State where the Licensor resides or has his registered office. “Member States” are the members of the European Space Agency pursuant to Art. 1 of the ESA Convention[1]. This licence shall be governed by German law if a dispute arises with the ESA as a Licensor or if the Licensor has no residence or registered office inside a Member State.
+
+9.2 Any dispute arising out of this License shall be finally settled in accordance with the Rules of Arbitration of the International Chamber of Commerce by one or more arbitrators designated in conformity with those rules. Arbitration proceedings shall take place in Cologne, Germany. The award shall be final and binding on the parties, no appeal shall lie against it. The enforcement of the award shall be governed by the rules of procedure in force in the state/country in which it is to be executed.
+
+9.3 For the avoidance of doubt, You are solely responsible for compliance with current applicable requirements of national laws. The Software can be subject to export control laws. If You export the Software it is your responsibility to comply with all export control laws. This may include different requirements, as e.g. registering the Software with the local authorities.
+
+
+
+9.4 If it is impossible for You to comply with any of the terms of this License due to statute, judicial order or regulation You must:
+
+comply with the terms of this License to the maximum extent possible; and
+describe the limitations and the Object Code and/or Source Code they affect. Such description must be included in the LEGAL notice described in Section 4. Except to the extent prohibited by statute or regulation, such description must be sufficiently detailed for an average recipient to be able to understand it.
+
+
+10 Miscellaneous
+
+
+
+10.1 Only ESA has the right to modify or publish new versions of this License. ESA may assign this right to other individuals or legal entities. Each version will be given a distinguishing version number.
+
+10.2 This License represents the complete agreement concerning subject matter hereof.
+
+10.3 If any provision of this License is held invalid or unenforceable, the remaining provisions of this License shall not be affected. The invalid or unenforceable provision shall be construed and/or reformed to the extent necessary to make it enforceable and valid.
+
+
+[1] As of June 2025 the Member States are Austria, Belgium, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Hungary, Ireland, Italy, Luxembourg, The Netherlands, Norway, Poland, Portugal, Romania, Slovenia, Spain, Sweden, Switzerland and the United Kingdom.
diff --git a/meta/files/common-licenses/ESA-PL-weak-copyleft-2.4 b/meta/files/common-licenses/ESA-PL-weak-copyleft-2.4
new file mode 100644
index 00000000000..7c27dc25067
--- /dev/null
+++ b/meta/files/common-licenses/ESA-PL-weak-copyleft-2.4
@@ -0,0 +1,193 @@
+European Space Agency Public License (ESA-PL) Weak Copyleft (Type 2) – v2.4
+
+ 
+
+1 Definitions
+
+ 
+
+1.1 “Contributor” means (a) the individual or legal entity that originally creates or later modifies the Software and (b) each subsequent individual or legal entity that creates or contributes to the creation of Modifications.
+
+1.2 “Contributor Version” means the version of the Software on which the Contributor based its Modifications.
+
+1.3 “Distribution” and “Distribute” means any act of selling, giving, lending, renting, distributing, communicating, transmitting, or otherwise making available, physically or electronically or by any other means, copies of the Software or Modifications.
+
+1.4 “ESA” means the European Space Agency.
+
+1.5 “License” means this document.
+
+1.6 “Licensor” means the individual or legal entity that Distributes the Software under the License to You.
+
+1.7 “Modification” means any work or software created that is based upon or derived from the Software (or portions thereof) or a modification of the Software (or portions thereof). For the avoidance of doubt, linking a library to the Software results in a Modification.
+
+1.8 “Object Code” means any non-Source Code form of the Software and/or Modifications.
+
+1.9 “Patent Claims” (of a Contributor) means any patent claim(s), owned at the time of the Distribution or subsequently acquired, including without limitation, method, process and apparatus claims, in any patent licensable by a Contributor which would be infringed by making use of the rights granted under Sec. 2.1, including but not limited to make, have made, use, sell, offer for sale or import of the Contributor Version and/or such Contributor’s Modifications (if any), either alone or in combination with the Contributor Version. “Licensable” means having the right to grant, whether at the time of the Distribution or subsequently acquired, the rights conveyed herein. 
+
+1.10 “Software” means the software Distributed under this License by the Licensor, in Source Code and/or Object Code form.
+
+1.11 “Source Code” means the preferred, usually human readable form of the Software and/or Modifications in which modifications are made and the associated documentation included in or with such code.
+
+1.12 “You” means an individual or legal entity exercising rights under this License (the licensee).
+
+ 
+
+2 Grant of Rights
+
+ 
+
+2.1 Copyright
+
+The Licensor, and each Contributor in respect of such Contributor’s Modifications, hereby grants You a world-wide, royalty-free, non-exclusive license under Copyright, subject to the terms and conditions of this License, to:
+
+use the Software;
+reproduce the Software by any or all means and in any or all form;
+Modify the Software and create works based on the Software;
+communicate to the public, including making available, display or perform the Software or copies thereof to the public;
+Distribute, sublicense, lend and rent the Software.
+The license grant is perpetual and irrevocable, unless terminated pursuant to Sec. 8.
+
+ 
+
+2.2 Patents
+
+Each Contributor in respect of such Contributor’s Modifications, hereby grants You a world-wide, royalty-free, non-exclusive, sub-licensable license under Patent Claims to the extent necessary to make use of the rights granted under Sec. 2.1, including but not limited to make, have made, use, sell, offer for sale, import, export and Distribute such Contributor’s Modifications and the combination of such Contributor’s Modifications with the Contributor Version (collectively called the “Patent Licensed Version” of the Software).
+
+No patent license is granted for claims that are infringed:
+
+only as a consequence of further modification of the Patent Licensed Version; or
+by the combination of the Patent Licensed Version with other software or other devices or hardware, unless such combination was an intended use case of the Patent Licensed Version (e.g. a general purpose library is intended to be used with other software, a satellite navigation software is intended to be used with appropriate hardware); or
+by a Modification under Patent Claims in the absence of the Contributor’s Modifications or by a combination of the Contributor’s Modifications with software other than the Patent Licensed Version or Modifications thereof.
+ 
+
+2.3 Trademark
+
+This License does not grant permission to use trade names, trademarks, services marks, logos or names of the Licensor, except as required for reasonable and customary use in describing the origin of the Software and as reasonable necessary to comply with the obligations of this License (e.g. by reproducing the content of the notices). For the avoidance of doubt, upon Distribution of Modifications You must not use the Licensor’s or ESA’s trademarks, names or logos in any way that states or implies, or can be interpreted as stating or implying, that the final product is endorsed or created by the Licensor or ESA.
+
+ 
+
+3 Distribution
+
+ 
+
+3.1 Copyleft Clause
+
+All Distribution of the Software and/or Modifications, as Source Code or Object Code, must be, as a whole, either under (a) the terms of this License or the ESA-PL Strong Copyleft license v2.4 or (b) any later version of these Licenses unless the Software is expressly Distributed only under a specific version of the License by a Contributor or (c) the terms of a compatible license as listed in Appendix A to this License. Any obligation in this License to Distribute under the terms of this License, in particular as set out in Sec. 3.2, shall be construed as referring to “this License or a compatible license”.
+
+3.2 Copyleft exceptions
+
+3.2.1 Compilations. In the event of the Distribution of a compilation of Software and/or Modifications with other separate and independent works (for example in or on a volume of a storage or distribution medium), which are not by their nature extensions or other modifications of the Software and/or the Modifications, and which are not combined with it such as to form a single larger program, Distribution of the compilation does not cause this License to apply to the other parts of the compilation.
+
+3.2.2 System Libraries. System Libraries used by a Modification need not be Distributed under the terms of this License and need not be included as part of the Source Code pursuant to Sec. 3.3. “System Library” means anything that is normally distributed (in either source or binary form) with the major components (kernel, window system etc.) of the operating system(s) on which the Software or Modification runs, or a compiler used to produce the Object Code, or an object code interpreter used to run it.
+
+3.2.3 External Modules. You may create a Modification by combining Software with an external module enabling supplementary functions or services and Distribute the external module under different license terms, provided that the external module and the Software run in separate address spaces, with one calling the other, or each other interfacing, when they are run.
+
+3.2.4 Combinations. You may create a Modification (the “Combination”) by combining or linking the Software or Modifications thereof (the “Covered Code”) with additional code or software (the “External Code”) not governed by the terms of this License and Distribute the Combination
+
+in Object Code form under any license terms, and/or
+in Source Code form with the External Code’s Source Code under any license terms and the Covered Code’s Source Code under this License,
+provided that:
+the Covered Code will be governed by this License and the different license terms effectively do not restrict the rights granted by this License; and
+the External Code and its license terms are clearly identified and notice is given of the use of Covered Code and the applicability of this License; and
+the External Code’s Source Code is clearly separated from the Covered Code’s Source Code (usually contained in different files); and
+You communicate the Covered Code’s Source Code in accordance with Sec. 3.3. 
+ 
+
+3.3 Communication of the Source Code
+
+If You Distribute the Software and/or Modifications as Object Code, You must:
+
+provide in addition a copy of the Source Code of the Software and/or Modifications to each recipient; or
+make the Source Code of the Software and/or Modifications freely accessible by reasonable means for anyone who possesses the Object Code or received the Software and/or Modifications from You, and inform recipients how to obtain a copy of the Source Code. Such information needs to be included at a minimum in the “NOTICE” file pursuant to Sec. 4.4 You are obliged to make the Source Code accessible in accordance with this Section for as long as You continue to Distribute the Software and/or Modifications and at a minimum for a three year period following Your last Distribution of the Software and/or Modifications.
+ 
+
+3.4 Dual Licensing
+
+This License gives no permission to license the Software or Modifications in any other way, but it does not invalidate such permission if You have separately received it.
+
+ 
+
+4 Notices
+
+The following obligations apply in the event of any Distribution of the Software and/or Modifications as Source Code and/or Object Code:
+
+4.1 You must include a copy of this License and all of the notices set out in this Sec. 4.
+
+4.2 You may not remove or alter any copyright, patent, trademark and attribution notices nor any of the notices set out in this Sec. 4, except as necessary for your compliance with this License or otherwise permitted by this License, except for those notices that do not pertain to the Modifications You Distribute.
+
+4.3 Each Contributor must cause its Modification carrying prominent notices stating that the Software has been modified and the date of modification and identify itself as the originator of its Modifications in a manner that reasonably allows identification and contact with the Contributor. The aforementioned notices must at a minimum be in a text file included with the Distribution titled “CHANGELOG”.
+
+4.4 The Software may include a "NOTICE" text file containing general notices. Any Contributor can create such a NOTICE file or add notices to it, alongside or as an addendum to the original text, provided that such notices cannot be construed as modifying the License. 
+
+4.5 Each Contributor must identify all of its Patent Claims by providing at a minimum the patent number and identification and contact information in a text file included with the Distribution titled "LEGAL".
+
+ 
+
+5 Warranty and Liability 
+
+5.1 Each Contributor warrants and represents that it has sufficient rights to grant the rights to its Modifications conveyed by this License.
+
+5.2 Except as expressly set forth in this License, the Software is provided to You on an “as is” basis and without warranties of any kind, including without limitation merchantability, fitness for a particular purpose, absence of defects or errors, accuracy or non-infringement of intellectual property rights. Mandatory statutory warranty claims, e.g. in the event of wilful deception or fraudulent misrepresentation, shall remain unaffected.
+
+5.3 Except as expressly set forth in this License, neither Licensor nor any Contributor shall be liable, including, without limitation, for direct, indirect, incidental, or consequential damages (including without limitation loss of profit), however caused and on any theory of liability, arising in any way out of the use or Distribution of the Software or the exercise of any rights under this License, even if You have been advised of the possibility of such damages. Mandatory statutory liability claims, e.g. in the event of wilful misconduct, wilful deception or fraudulent misrepresentation, shall remain unaffected.
+
+ 
+
+6 Additional Agreements
+
+While Distributing the Software or Modifications, You may choose to conclude additional agreements, for free or for charge, regarding for example support, warranty, indemnity, liability or liability obligations and/or rights, provided such additional agreements are consistent with this License and do not effectively restrict the recipient’s rights under this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor or Licensor, and only if You agree to indemnify, defend, and hold each Contributor or Licensor harmless for any liability incurred by, or claims asserted against, such Contributor or Licensor by reason of your accepting any such warranty or additional liability.
+
+ 
+
+7 Infringements
+
+7.1 You acknowledge that continuing to use the Software knowing that such use infringes third party rights (e.g. after receiving a third party notification of infringement) would expose you to the risk of being considered as intentionally infringing third party rights. In such event You should acquire the respective rights or modify the Software so that the Modification is non-infringing.
+
+ 
+
+8 Termination
+
+8.1 This License and the rights granted hereunder will terminate automatically upon any breach by You with the terms of this License if you fail to cure such breach within 30 days of becoming aware of the breach.
+
+8.2 If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Software constitutes direct or contributory patent infringement, then any patent and copyright licenses granted to You under this License for the Software shall terminate as of the date such litigation is filed.
+
+8.3 Any licenses validly granted by You under the License prior to termination shall continue and survive termination.
+
+ 
+
+9 Applicable Law, Arbitration and Compliance
+
+9.1 This License is governed by the laws of the ESA Member State where the Licensor resides or has his registered office. “Member States” are the members of the European Space Agency pursuant to Art. 1 of the ESA Convention[1]. This licence shall be governed by German law if a dispute arises with the ESA as a Licensor or if the Licensor has no residence or registered office inside a Member State.
+
+9.2 Any dispute arising out of this License shall be finally settled in accordance with the Rules of Arbitration of the International Chamber of Commerce by one or more arbitrators designated in conformity with those rules. Arbitration proceedings shall take place in Cologne, Germany. The award shall be final and binding on the parties, no appeal shall lie against it. The enforcement of the award shall be governed by the rules of procedure in force in the state/country in which it is to be executed.
+
+9.3 For the avoidance of doubt, You are solely responsible for compliance with current applicable requirements of national laws. The Software can be subject to export control laws. If You export the Software it is your responsibility to comply with all export control laws. This may include different requirements, as e.g. registering the Software with the local authorities.
+
+9.4 If it is impossible for You to comply with any of the terms of this License due to statute, judicial order or regulation You must:
+
+comply with the terms of this License to the maximum extent possible; and
+describe the limitations and the Object Code and/or Source Code they affect. Such description must be included in the LEGAL notice described in Section 4. Except to the extent prohibited by statute or regulation, such description must be sufficiently detailed for an average recipient to be able to understand it.
+ 
+
+10 Miscellaneous
+
+10.1 Only ESA has the right to modify or publish new versions of this License. ESA may assign this right to other individuals or legal entities. Each version will be given a distinguishing version number.
+
+10.2 This License represents the complete agreement concerning subject matter hereof.
+
+10.3 If any provision of this License is held invalid or unenforceable, the remaining provisions of this License shall not be affected. The invalid or unenforceable provision shall be construed and/or reformed to the extent necessary to make it enforceable and valid.
+
+ 
+
+Appendix A – List of compatible licenses
+
+ 
+
+Compatible licenses are:
+
+GNU General Public License (GPL)  version 2 and any subsequent version
+CeCILL version 2 and any subsequent version
+ 
+
+ 
+[1] As of January 2020 the Member States are Austria, Belgium, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Hungary, Ireland, Italy, Luxembourg, The Netherlands, Norway, Poland, Portugal, Romania, Spain, Sweden, Switzerland and the United Kingdom.
diff --git a/meta/files/common-licenses/HPND-SMC b/meta/files/common-licenses/HPND-SMC
new file mode 100644
index 00000000000..79c1e948e45
--- /dev/null
+++ b/meta/files/common-licenses/HPND-SMC
@@ -0,0 +1,15 @@
+Copyright 2000, Mojam Media, Inc., all rights reserved. Author: Skip Montanaro
+
+Copyright 1999, Bioreason, Inc., all rights reserved. Author: Andrew Dalke
+
+Copyright 1995-1997, Automatrix, Inc., all rights reserved. Author: Skip Montanaro
+
+Copyright 1991-1995, Stichting Mathematisch Centrum, all rights reserved.
+
+Permission to use, copy, modify, and distribute this Python software and its
+associated documentation for any purpose without fee is hereby granted,
+provided that the above copyright notice appears in all copies, and that both
+that copyright notice and this permission notice appear in supporting
+documentation, and that the name of neither Automatrix, Bioreason or Mojam
+Media be used in advertising or publicity pertaining to distribution of the
+software without specific, written prior permission.
diff --git a/meta/files/common-licenses/HPND-sell-variant-critical-systems b/meta/files/common-licenses/HPND-sell-variant-critical-systems
new file mode 100644
index 00000000000..b71219d4c21
--- /dev/null
+++ b/meta/files/common-licenses/HPND-sell-variant-critical-systems
@@ -0,0 +1,20 @@
+Alan Cox <alan@redhat.com>
+Permission to use, copy, modify, distribute, and sell this software and its
+documentation for any purpose is hereby granted without fee, provided that
+the above copyright notice appear in all copies and that both that
+copyright notice and this permission notice appear in supporting
+documentation, and that the names of Red Hat, Alan Cox and Henrik Harmsen
+not be used in advertising or publicity pertaining to distribution of the
+software without specific, written prior permission.  Th authors make no
+representations about the suitability of this software for any purpose.
+It is provided "as is" without express or implied warranty.
+THE AUTHORS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+EVENT SHALL RICHARD HECKER BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THIS SOFTWARE.
+
+THIS SOFTWARE IS NOT DESIGNED FOR USE IN SAFETY CRITICAL SYSTEMS OF
+ANY KIND OR FORM.
diff --git a/meta/files/common-licenses/ISO-permission b/meta/files/common-licenses/ISO-permission
new file mode 100644
index 00000000000..fc0ddeab3b9
--- /dev/null
+++ b/meta/files/common-licenses/ISO-permission
@@ -0,0 +1,4 @@
+(C) International Organization for Standardization 1986
+Permission to copy in any form is granted for use with
+conforming SGML systems and applications as defined 
+in ISO 8879, provided this notice is included in all copies.
diff --git a/meta/files/common-licenses/MIT-STK b/meta/files/common-licenses/MIT-STK
new file mode 100644
index 00000000000..40397a37b12
--- /dev/null
+++ b/meta/files/common-licenses/MIT-STK
@@ -0,0 +1,27 @@
+The Synthesis ToolKit in C++ (STK)
+
+Copyright (c) 1995-2023 Perry R. Cook and Gary P. Scavone
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+Any person wishing to distribute modifications to the Software is
+asked to send the modifications to the original developer so that they
+can be incorporated into the canonical version.  This is, however, not
+a binding provision of this license.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
+ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
+CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta/files/common-licenses/MMPL-1.0.1 b/meta/files/common-licenses/MMPL-1.0.1
new file mode 100644
index 00000000000..6556291ea28
--- /dev/null
+++ b/meta/files/common-licenses/MMPL-1.0.1
@@ -0,0 +1,87 @@
+Minecraft Mod Public License
+============================
+
+Version 1.0.1
+
+0. Definitions
+--------------
+
+Minecraft: Denotes a copy of the Minecraft game licensed by Mojang AB
+
+User: Anybody that interacts with the software in one of the following ways:
+   - play
+   - decompile
+   - recompile or compile
+   - modify
+   - distribute
+
+Mod: The mod code designated by the present license, in source form, binary
+form, as obtained standalone, as part of a wider distribution or resulting from
+the compilation of the original or modified sources.
+
+Dependency: Code required for the mod to work properly. This includes
+dependencies required to compile the code as well as any file or modification
+that is explicitely or implicitely required for the mod to be working.
+
+1. Scope
+--------
+
+The present license is granted to any user of the mod. As a prerequisite,
+a user must own a legally acquired copy of Minecraft
+
+2. Liability
+------------
+
+This mod is provided 'as is' with no warranties, implied or otherwise. The owner
+of this mod takes no responsibility for any damages incurred from the use of
+this mod. This mod alters fundamental parts of the Minecraft game, parts of
+Minecraft may not work with this mod installed. All damages caused from the use
+or misuse of this mad fall on the user.
+
+3. Play rights
+--------------
+
+The user is allowed to install this mod on a client or a server and to play
+without restriction.
+
+4. Modification rights
+----------------------
+
+The user has the right to decompile the source code, look at either the
+decompiled version or the original source code, and to modify it.
+
+5. Derivation rights
+--------------------
+
+The user has the rights to derive code from this mod, that is to say to
+write code that extends or instanciate the mod classes or interfaces, refer to
+its objects, or calls its functions. This code is known as "derived" code, and
+can be licensed under a license different from this mod.
+
+6. Distribution of original or modified copy rights
+---------------------------------------------------
+
+Is subject to distribution rights this entire mod in its various forms. This
+include:
+   - original binary or source forms of this mod files
+   - modified versions of these binaries or source files, as well as binaries
+     resulting from source modifications
+   - patch to its source or binary files
+   - any copy of a portion of its binary source files
+
+The user is allowed to redistribute this mod partially, in totality, or
+included in a distribution.
+
+When distributing binary files, the user must provide means to obtain its
+entire set of sources or modified sources at no costs.
+
+All distributions of this mod must remain licensed under the MMPL.
+
+All dependencies that this mod have on other mods or classes must be licensed
+under conditions comparable to this version of MMPL, with the exception of the
+Minecraft code and the mod loading framework (e.g. ModLoader, ModLoaderMP or
+Bukkit).
+
+Modified version of binaries and sources, as well as files containing sections
+copied from this mod, should be distributed under the terms of the present
+license.
diff --git a/meta/files/common-licenses/NIST-PD-TNT b/meta/files/common-licenses/NIST-PD-TNT
new file mode 100644
index 00000000000..51202893ac9
--- /dev/null
+++ b/meta/files/common-licenses/NIST-PD-TNT
@@ -0,0 +1,3 @@
+This software was developed at the National Institute of Standards and Technology (NIST) by employees of the Federal Government in the course of their official duties. Pursuant to title 17 Section 105 of the United States Code this software is not subject to copyright protection and is in the public domain. NIST assumes no responsibility whatsoever for its use by other parties, and makes no guarantees, expressed or implied, about its quality, reliability, or any other characteristic.
+
+We would appreciate acknowledgement if the software is incorporated in redistributable libraries or applications.
diff --git a/meta/files/common-licenses/OSC-1.0 b/meta/files/common-licenses/OSC-1.0
new file mode 100644
index 00000000000..23289f0f478
--- /dev/null
+++ b/meta/files/common-licenses/OSC-1.0
@@ -0,0 +1,11 @@
+Copyright (c) <Jahr> <Copyright Inhaber>
+
+Jedem, der eine Kopie dieser Software und der zugehörigen Dokumentationsdateien (die „Software“) erhält, wird hiermit kostenlos die Erlaubnis erteilt, ohne Einschränkung die Software zu verwenden, einschließlich und ohne Einschränkung der Rechte zur Nutzung, zum Kopieren, Ändern, Zusammenführen, Veröffentlichen, Verteilen, Unterlizenzieren und/oder Verkaufen von Kopien der Software, und Personen, denen die Software zur Verfügung gestellt wird, dies unter den folgenden Bedingungen zu gestatten:
+
+Der obige Urheberrechtshinweis und dieser Genehmigungshinweis müssen in allen Kopien oder wesentlichen Teilen der Software enthalten sein.
+
+DIE URHEBER ODER URHEBERRECHTSINHABER HAFTEN UNBESCHRÄNKT BEI VORSATZ, ARGLISTIGER TÄUSCHUNG, GROBER FAHRLÄSSIGKEIT, DER VERLETZUNG VON LEIB, LEBEN ODER GESUNDHEIT UND SOWEIT DIE HAFTUNG GESETZLICH NICHT BESCHRÄNKT ODER AUSGESCHLOSSEN WERDEN KANN. BEI FAHRLÄSSIGER VERLETZUNG EINER PFLICHT, DEREN ERFÜLLUNG WESENTLICH FÜR DIE DURCHFÜHRUNG DES VERTRAGS IST (KARDINALPFLICHT), HAFTEN DIE URHEBER ODER URHEBERRECHTSINHABER DER HÖHE NACH BEGRENZT AUF DEN SCHADEN, DER BEI VERTRAGSSCHLUSS VORHERSEHBAR UND TYPISCH IST.
+
+DARÜBER HINAUS IST EINE HAFTUNG AUSGESCHLOSSEN.
+
+DIE VORSTEHENDE HAFTUNGSBESCHRÄNKUNG GILT AUCH FÜR DIE HAFTUNG DER MITARBEITER, VERTRETER UND ORGANE DER URHEBER ODER URHEBERRECHTSINHABER.
diff --git a/meta/files/common-licenses/OSSP b/meta/files/common-licenses/OSSP
new file mode 100644
index 00000000000..92a1d4705d8
--- /dev/null
+++ b/meta/files/common-licenses/OSSP
@@ -0,0 +1,26 @@
+COPYRIGHT AND LICENSE
+
+  Copyright (c) 2001-2005 Ralf S. Engelschall <rse@engelschall.com>
+  Copyright (c) 2001-2005 The OSSP Project <http://www.ossp.org/>
+  Copyright (c) 2001-2005 Cable & Wireless <http://www.cw.com/>
+
+  This file is part of OSSP var, a variable expansion
+  library which can be found at http://www.ossp.org/pkg/lib/var/.
+
+  Permission to use, copy, modify, and distribute this software for
+  any purpose with or without fee is hereby granted, provided that
+  the above copyright notice and this permission notice appear in all
+  copies.
+
+  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
+  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+  IN NO EVENT SHALL THE AUTHORS AND COPYRIGHT HOLDERS AND THEIR
+  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
+  USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+  SUCH DAMAGE.
diff --git a/meta/files/common-licenses/OpenMDW-1.0 b/meta/files/common-licenses/OpenMDW-1.0
new file mode 100644
index 00000000000..5166ede9b65
--- /dev/null
+++ b/meta/files/common-licenses/OpenMDW-1.0
@@ -0,0 +1,49 @@
+OpenMDW License Agreement, version 1.0 (OpenMDW-1.0)
+
+By exercising rights granted to you under this agreement, you accept and agree
+to its terms.
+
+As used in this agreement, "Model Materials" means the materials provided to
+you under this agreement, consisting of: (1) one or more machine learning
+models (including architecture and parameters); and (2) all related artifacts
+(including associated data, documentation and software) that are provided to
+you hereunder.
+
+Subject to your compliance with this agreement, permission is hereby granted,
+free of charge, to deal in the Model Materials without restriction, including
+under all copyright, patent, database, and trade secret rights included or
+embodied therein.
+
+If you distribute any portion of the Model Materials, you shall retain in your
+distribution (1) a copy of this agreement, and (2) all copyright notices and
+other notices of origin included in the Model Materials that are applicable to
+your distribution.
+
+If you file, maintain, or voluntarily participate in a lawsuit against any
+person or entity asserting that the Model Materials directly or indirectly
+infringe any patent, then all rights and grants made to you hereunder are
+terminated, unless that lawsuit was in response to a corresponding lawsuit
+first brought against you.
+
+This agreement does not impose any restrictions or obligations with respect to
+any use, modification, or sharing of any outputs generated by using the Model
+Materials.
+
+THE MODEL MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE, TITLE, NONINFRINGEMENT, ACCURACY, OR THE
+ABSENCE OF LATENT OR OTHER DEFECTS OR ERRORS, WHETHER OR NOT DISCOVERABLE, ALL
+TO THE GREATEST EXTENT PERMISSIBLE UNDER APPLICABLE LAW.
+
+YOU ARE SOLELY RESPONSIBLE FOR (1) CLEARING RIGHTS OF OTHER PERSONS THAT MAY
+APPLY TO THE MODEL MATERIALS OR ANY USE THEREOF, INCLUDING WITHOUT LIMITATION
+ANY PERSON'S COPYRIGHTS OR OTHER RIGHTS INCLUDED OR EMBODIED IN THE MODEL
+MATERIALS; (2) OBTAINING ANY NECESSARY CONSENTS, PERMISSIONS OR OTHER RIGHTS
+REQUIRED FOR ANY USE OF THE MODEL MATERIALS; OR (3) PERFORMING ANY DUE
+DILIGENCE OR UNDERTAKING ANY OTHER INVESTIGATIONS INTO THE MODEL MATERIALS OR
+ANYTHING INCORPORATED OR EMBODIED THEREIN.
+
+IN NO EVENT SHALL THE PROVIDERS OF THE MODEL MATERIALS BE LIABLE FOR ANY CLAIM,
+DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE MODEL MATERIALS, THE
+USE THEREOF OR OTHER DEALINGS THEREIN.
diff --git a/meta/files/common-licenses/ParaType-Free-Font-1.3 b/meta/files/common-licenses/ParaType-Free-Font-1.3
new file mode 100644
index 00000000000..21f8140887e
--- /dev/null
+++ b/meta/files/common-licenses/ParaType-Free-Font-1.3
@@ -0,0 +1,24 @@
+ParaType Free Font Licensing Agreement
+
+Copyright (c) 2009, ParaType Ltd. All Rights Reserved.
+
+LICENSING AGREEMENT
+for the fonts with Original Name: PT Sans, PT Serif, PT Mono
+Version 1.3 - January 20, 2012
+
+GRANT OF LICENSE
+ParaType Ltd grants you the right to use, copy, modify the fonts and distribute modified and unmodified copies of the fonts by any means, including placing on Web servers for free downloading, embedding in documents and Web pages, bundling with commercial and non commercial products, if it does not conflict with the conditions listed below:
+
+- You may bundle the fonts with commercial software, but you may not sell the fonts by themselves. They are free.
+
+- You may distribute the fonts in modified or unmodified versions only together with this Licensing Agreement and with above copyright notice. You have no right to modify the text of Licensing Agreement. It can be placed in a separate text file or inserted into the font file, but it must be easily viewed by users.
+
+- You may not distribute modified version of the font under the Original name or а combination of Original name with any other words without explicit written permission from ParaType.
+
+TERMINATION & TERRITORY
+This license has no limits on time and territory, but it becomes null and void if any of the above conditions are not met.
+
+DISCLAIMER
+THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL PARATYPE BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM OTHER DEALINGS IN THE FONT SOFTWARE.
+
+ParaType Ltd
diff --git a/meta/files/common-licenses/SGMLUG-PM b/meta/files/common-licenses/SGMLUG-PM
new file mode 100644
index 00000000000..552f8be94a0
--- /dev/null
+++ b/meta/files/common-licenses/SGMLUG-PM
@@ -0,0 +1,43 @@
+LICENSE AND DISCLAIMER OF WARRANTIES
+
+      Standard Generalized Markup Language Users' Group (SGMLUG)
+                         SGML Parser Materials
+
+                              1. License
+
+SGMLUG hereby grants to any user: (1) an irrevocable royalty-free,
+worldwide, non-exclusive license to use, execute, reproduce, display,
+perform and distribute copies of, and to prepare derivative works
+based upon these materials; and (2) the right to authorize others to
+do any of the foregoing.
+
+                     2. Disclaimer of Warranties
+
+(a) The SGML Parser Materials are provided "as is" to any USER.  USER
+assumes responsibility for determining the suitability of the SGML
+Parser Materials for its use and for results obtained.  SGMLUG makes
+no warranty that any errors have been eliminated from the SGML Parser
+Materials or that they can be eliminated by USER.  SGMLUG shall not
+provide any support maintenance or other aid to USER or its licensees
+with respect to SGML Parser Materials.  SGMLUG shall not be
+responsible for losses of any kind resulting from use of the SGML
+Parser Materials including (without limitation) any liability for
+business expense, machine downtime, or damages caused to USER or third
+parties by any deficiency, defect, error, or malfunction.
+
+(b) SGMLUG DISCLAIMS ALL WARRANTIES, EXPRESSED OR IMPLIED, ARISING OUT
+OF OR RELATING TO THE SGML PARSER MATERIALS OR ANY USE THEREOF,
+INCLUDING (WITHOUT LIMITATION) ANY WARRANTY WHATSOEVER AS TO THE
+FITNESS FOR A PARTICULAR USE OR THE MERCHANTABILITY OF THE SGML PARSER
+MATERIALS.
+
+(c) In no event shall SGMLUG be liable to USER or third parties
+licensed by USER for any indirect, special, incidental, or
+consequential damages (including lost profits).
+(d) SGMLUG has no knowledge of any conditions that would impair its right
+to license the SGML Parser Materials.  Notwithstanding the foregoing,
+SGMLUG does not make any warranties or representations that the
+SGML Parser Materials are free of claims by third parties of patent,
+copyright infringement or the like, nor does SGMLUG assume any
+liability in respect of any such infringement of rights of third
+parties due to USER's operation under this license.
diff --git a/meta/files/common-licenses/TekHVC b/meta/files/common-licenses/TekHVC
new file mode 100644
index 00000000000..6a3958717a1
--- /dev/null
+++ b/meta/files/common-licenses/TekHVC
@@ -0,0 +1,34 @@
+Code and supporting documentation (c) Copyright 1990 1991 Tektronix, Inc.
+	All Rights Reserved
+
+This file is a component of an X Window System-specific implementation
+of Xcms based on the TekColor Color Management System.  TekColor is a
+trademark of Tektronix, Inc.  The term "TekHVC" designates a particular
+color space that is the subject of U.S. Patent No. 4,985,853 (equivalent
+foreign patents pending).  Permission is hereby granted to use, copy,
+modify, sell, and otherwise distribute this software and its
+documentation for any purpose and without fee, provided that:
+
+1. This copyright, permission, and disclaimer notice is reproduced in
+   all copies of this software and any modification thereof and in
+   supporting documentation;
+2. Any color-handling application which displays TekHVC color
+   cooordinates identifies these as TekHVC color coordinates in any
+   interface that displays these coordinates and in any associated
+   documentation;
+3. The term "TekHVC" is always used, and is only used, in association
+   with the mathematical derivations of the TekHVC Color Space,
+   including those provided in this file and any equivalent pathways and
+   mathematical derivations, regardless of digital (e.g., floating point
+   or integer) representation.
+
+Tektronix makes no representation about the suitability of this software
+for any purpose.  It is provided "as is" and with all faults.
+
+TEKTRONIX DISCLAIMS ALL WARRANTIES APPLICABLE TO THIS SOFTWARE,
+INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+PARTICULAR PURPOSE.  IN NO EVENT SHALL TEKTRONIX BE LIABLE FOR ANY
+SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
+RESULTING FROM LOSS OF USE, DATA, OR PROFITS, WHETHER IN AN ACTION OF
+CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
+CONNECTION WITH THE USE OR THE PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/UnRAR b/meta/files/common-licenses/UnRAR
new file mode 100644
index 00000000000..645b6071c83
--- /dev/null
+++ b/meta/files/common-licenses/UnRAR
@@ -0,0 +1,41 @@
+******    *****   ******   UnRAR - free utility for RAR archives
+ **   **  **   **  **   **  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ ******   *******  ******    License for use and distribution of
+ **   **  **   **  **   **   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ **   **  **   **  **   **         FREE portable version
+                                   ~~~~~~~~~~~~~~~~~~~~~
+
+      The source code of UnRAR utility is freeware. This means:
+
+   1. All copyrights to RAR and the utility UnRAR are exclusively
+      owned by the author - Alexander Roshal.
+
+   2. UnRAR source code may be used in any software to handle
+      RAR archives without limitations free of charge, but cannot be
+      used to develop RAR (WinRAR) compatible archiver and to
+      re-create RAR compression algorithm, which is proprietary.
+      Distribution of modified UnRAR source code in separate form
+      or as a part of other software is permitted, provided that
+      full text of this paragraph, starting from "UnRAR source code"
+      words, is included in license, or in documentation if license
+      is not available, and in source code comments of resulting package.
+
+   3. The UnRAR utility may be freely distributed. It is allowed
+      to distribute UnRAR inside of other software packages.
+
+   4. THE RAR ARCHIVER AND THE UnRAR UTILITY ARE DISTRIBUTED "AS IS".
+      NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  YOU USE AT 
+      YOUR OWN RISK. THE AUTHOR WILL NOT BE LIABLE FOR DATA LOSS, 
+      DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING
+      OR MISUSING THIS SOFTWARE.
+
+   5. Installing and using the UnRAR utility signifies acceptance of
+      these terms and conditions of the license.
+
+   6. If you don't agree with terms of the license you must remove
+      UnRAR files from your storage devices and cease to use the
+      utility.
+
+      Thank you for your interest in RAR and UnRAR.
+
+                                            Alexander L. Roshal
diff --git a/meta/files/common-licenses/Vixie-Cron b/meta/files/common-licenses/Vixie-Cron
new file mode 100644
index 00000000000..3fefb02f27e
--- /dev/null
+++ b/meta/files/common-licenses/Vixie-Cron
@@ -0,0 +1,4 @@
+Copyright 1988,1990,1993 by Paul Vixie
+All rights reserved
+
+Distribute freely, except: don't remove my name from the source or documentation (don't take credit for my work), mark your changes (don't get me blamed for your possible bugs), don't alter or remove this notice. May be sold if buildable source is provided to buyer. No warrantee of any kind, express or implied, is included with this software; use at your own risk, responsibility for damages (if any) to anyone resulting from the use of this software rests entirely with the user.
diff --git a/meta/files/common-licenses/WTFNMFPL b/meta/files/common-licenses/WTFNMFPL
new file mode 100644
index 00000000000..e76917a9bc4
--- /dev/null
+++ b/meta/files/common-licenses/WTFNMFPL
@@ -0,0 +1,17 @@
+DO WHAT THE FUCK YOU WANT TO BUT IT'S NOT MY FAULT PUBLIC LICENSE
+                    Version 1, October 2013
+
+ Copyright (C) 2013 Ben McGinnes <ben@adversary.org>
+
+ Everyone is permitted to copy and distribute verbatim or modified
+ copies of this license document, and changing it is allowed as long
+ as the name is changed.
+
+   DO WHAT THE FUCK YOU WANT TO BUT IT'S NOT MY FAULT PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. You just DO WHAT THE FUCK YOU WANT TO.
+
+  1. Do not hold the author(s), creator(s), developer(s) or
+     distributor(s) liable for anything that happens or goes wrong
+     with your use of the work.
diff --git a/meta/files/common-licenses/WordNet b/meta/files/common-licenses/WordNet
new file mode 100644
index 00000000000..b937fa5cb38
--- /dev/null
+++ b/meta/files/common-licenses/WordNet
@@ -0,0 +1,12 @@
+WordNet Release 3.0
+This software and database is being provided to you, the LICENSEE, by Princeton University under the following license.
+
+By obtaining, using and/or copying this software and database, you agree that you have read, understood, and will comply with these terms and conditions.:
+
+Permission to use, copy, modify and distribute this software and database and its documentation for any purpose and without fee or royalty is hereby granted, provided that you agree to comply with the following copyright notice and statements, including the disclaimer, and that the same appear on ALL copies of the software, database and documentation, including modifications that you make for internal use or for distribution.
+
+WordNet 3.0 Copyright 2006 by Princeton University. All rights reserved.
+
+THIS SOFTWARE AND DATABASE IS PROVIDED "AS IS" AND PRINCETON UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, PRINCETON UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES OF MERCHANT- ABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE, DATABASE OR DOCUMENTATION WILL NOT INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
+
+The name of Princeton University or Princeton may not be used in advertising or publicity pertaining to distribution of the software and/or database. Title to copyright in this software, database and any associated documentation shall at all times remain with Princeton University and LICENSEE agrees to preserve same.
diff --git a/meta/files/common-licenses/X11-no-permit-persons b/meta/files/common-licenses/X11-no-permit-persons
new file mode 100644
index 00000000000..504b2eb7bd9
--- /dev/null
+++ b/meta/files/common-licenses/X11-no-permit-persons
@@ -0,0 +1,23 @@
+Copyright (c) 1991, 1997 Digital Equipment Corporation, Maynard, Massachusetts.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software.
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+DIGITAL EQUIPMENT CORPORATION BE LIABLE FOR ANY CLAIM, DAMAGES, INCLUDING,
+BUT NOT LIMITED TO CONSEQUENTIAL OR INCIDENTAL DAMAGES, OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
+IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+Except as contained in this notice, the name of Digital Equipment Corporation
+shall not be used in advertising or otherwise to promote the sale, use or other
+dealings in this Software without prior written authorization from Digital
+Equipment Corporation.
diff --git a/meta/files/common-licenses/hyphen-bulgarian b/meta/files/common-licenses/hyphen-bulgarian
new file mode 100644
index 00000000000..6642d1c676b
--- /dev/null
+++ b/meta/files/common-licenses/hyphen-bulgarian
@@ -0,0 +1,8 @@
+This software may be used, modified, copied, distributed, and sold,
+both in source and binary form provided that the above copyright
+notice and these terms are retained. The name of the author may not
+be used to endorse or promote products derived from this software
+without prior permission.  THIS SOFTWARE IS PROVIDES "AS IS" AND
+ANY EXPRESS OR IMPLIED WARRANTIES ARE DISCLAIMED.  IN NO EVENT
+SHALL THE AUTHOR BE LIABLE FOR ANY DAMAGES ARISING IN ANY WAY OUT
+OF THE USE OF THIS SOFTWARE.
diff --git a/meta/files/spdx-licenses.json b/meta/files/spdx-licenses.json
index a568067dd96..4a3e2269119 100644
--- a/meta/files/spdx-licenses.json
+++ b/meta/files/spdx-licenses.json
@@ -1,5 +1,5 @@
 {
-  "licenseListVersion": "3.27.0",
+  "licenseListVersion": "3.28.0",
   "licenses": [
     {
       "detailsUrl": "https://spdx.org/licenses/0BSD.json",
@@ -8,7 +8,7 @@
       "licenseId": "0BSD",
       "name": "BSD Zero Clause License",
       "reference": "https://spdx.org/licenses/0BSD.html",
-      "referenceNumber": 316,
+      "referenceNumber": 422,
       "seeAlso": [
         "http://landley.net/toybox/license.html",
         "https://opensource.org/licenses/0BSD"
@@ -21,7 +21,7 @@
       "licenseId": "3D-Slicer-1.0",
       "name": "3D Slicer License v1.0",
       "reference": "https://spdx.org/licenses/3D-Slicer-1.0.html",
-      "referenceNumber": 61,
+      "referenceNumber": 134,
       "seeAlso": [
         "https://slicer.org/LICENSE",
         "https://github.com/Slicer/Slicer/blob/main/License.txt"
@@ -34,7 +34,7 @@
       "licenseId": "AAL",
       "name": "Attribution Assurance License",
       "reference": "https://spdx.org/licenses/AAL.html",
-      "referenceNumber": 424,
+      "referenceNumber": 94,
       "seeAlso": [
         "https://opensource.org/licenses/attribution"
       ]
@@ -46,7 +46,7 @@
       "licenseId": "Abstyles",
       "name": "Abstyles License",
       "reference": "https://spdx.org/licenses/Abstyles.html",
-      "referenceNumber": 252,
+      "referenceNumber": 16,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Abstyles"
       ]
@@ -58,7 +58,7 @@
       "licenseId": "AdaCore-doc",
       "name": "AdaCore Doc License",
       "reference": "https://spdx.org/licenses/AdaCore-doc.html",
-      "referenceNumber": 315,
+      "referenceNumber": 291,
       "seeAlso": [
         "https://github.com/AdaCore/xmlada/blob/master/docs/index.rst",
         "https://github.com/AdaCore/gnatcoll-core/blob/master/docs/index.rst",
@@ -72,7 +72,7 @@
       "licenseId": "Adobe-2006",
       "name": "Adobe Systems Incorporated Source Code License Agreement",
       "reference": "https://spdx.org/licenses/Adobe-2006.html",
-      "referenceNumber": 658,
+      "referenceNumber": 373,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
       ]
@@ -84,7 +84,7 @@
       "licenseId": "Adobe-Display-PostScript",
       "name": "Adobe Display PostScript License",
       "reference": "https://spdx.org/licenses/Adobe-Display-PostScript.html",
-      "referenceNumber": 499,
+      "referenceNumber": 136,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYING?ref_type=heads#L752"
       ]
@@ -96,7 +96,7 @@
       "licenseId": "Adobe-Glyph",
       "name": "Adobe Glyph List License",
       "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
-      "referenceNumber": 492,
+      "referenceNumber": 345,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
       ]
@@ -108,7 +108,7 @@
       "licenseId": "Adobe-Utopia",
       "name": "Adobe Utopia Font License",
       "reference": "https://spdx.org/licenses/Adobe-Utopia.html",
-      "referenceNumber": 554,
+      "referenceNumber": 121,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/font/adobe-utopia-100dpi/-/blob/master/COPYING?ref_type=heads"
       ]
@@ -120,11 +120,23 @@
       "licenseId": "ADSL",
       "name": "Amazon Digital Services License",
       "reference": "https://spdx.org/licenses/ADSL.html",
-      "referenceNumber": 76,
+      "referenceNumber": 242,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesLicense"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Advanced-Cryptics-Dictionary.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Advanced-Cryptics-Dictionary",
+      "name": "Advanced Cryptics Dictionary License",
+      "reference": "https://spdx.org/licenses/Advanced-Cryptics-Dictionary.html",
+      "referenceNumber": 511,
+      "seeAlso": [
+        "https://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-2020.12.07-0.tar.bz2"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/AFL-1.1.json",
       "isDeprecatedLicenseId": false,
@@ -133,7 +145,7 @@
       "licenseId": "AFL-1.1",
       "name": "Academic Free License v1.1",
       "reference": "https://spdx.org/licenses/AFL-1.1.html",
-      "referenceNumber": 7,
+      "referenceNumber": 122,
       "seeAlso": [
         "http://opensource.linux-mirror.org/licenses/afl-1.1.txt",
         "http://wayback.archive.org/web/20021004124254/http://www.opensource.org/licenses/academic.php"
@@ -147,7 +159,7 @@
       "licenseId": "AFL-1.2",
       "name": "Academic Free License v1.2",
       "reference": "https://spdx.org/licenses/AFL-1.2.html",
-      "referenceNumber": 480,
+      "referenceNumber": 495,
       "seeAlso": [
         "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
         "http://wayback.archive.org/web/20021204204652/http://www.opensource.org/licenses/academic.php"
@@ -161,7 +173,7 @@
       "licenseId": "AFL-2.0",
       "name": "Academic Free License v2.0",
       "reference": "https://spdx.org/licenses/AFL-2.0.html",
-      "referenceNumber": 41,
+      "referenceNumber": 496,
       "seeAlso": [
         "http://wayback.archive.org/web/20060924134533/http://www.opensource.org/licenses/afl-2.0.txt"
       ]
@@ -174,7 +186,7 @@
       "licenseId": "AFL-2.1",
       "name": "Academic Free License v2.1",
       "reference": "https://spdx.org/licenses/AFL-2.1.html",
-      "referenceNumber": 682,
+      "referenceNumber": 460,
       "seeAlso": [
         "http://opensource.linux-mirror.org/licenses/afl-2.1.txt"
       ]
@@ -187,7 +199,7 @@
       "licenseId": "AFL-3.0",
       "name": "Academic Free License v3.0",
       "reference": "https://spdx.org/licenses/AFL-3.0.html",
-      "referenceNumber": 343,
+      "referenceNumber": 478,
       "seeAlso": [
         "http://www.rosenlaw.com/AFL3.0.htm",
         "https://opensource.org/licenses/afl-3.0"
@@ -200,7 +212,7 @@
       "licenseId": "Afmparse",
       "name": "Afmparse License",
       "reference": "https://spdx.org/licenses/Afmparse.html",
-      "referenceNumber": 84,
+      "referenceNumber": 560,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Afmparse"
       ]
@@ -213,7 +225,7 @@
       "licenseId": "AGPL-1.0",
       "name": "Affero General Public License v1.0",
       "reference": "https://spdx.org/licenses/AGPL-1.0.html",
-      "referenceNumber": 38,
+      "referenceNumber": 635,
       "seeAlso": [
         "http://www.affero.org/oagpl.html"
       ]
@@ -225,7 +237,7 @@
       "licenseId": "AGPL-1.0-only",
       "name": "Affero General Public License v1.0 only",
       "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
-      "referenceNumber": 415,
+      "referenceNumber": 660,
       "seeAlso": [
         "http://www.affero.org/oagpl.html"
       ]
@@ -237,7 +249,7 @@
       "licenseId": "AGPL-1.0-or-later",
       "name": "Affero General Public License v1.0 or later",
       "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
-      "referenceNumber": 24,
+      "referenceNumber": 13,
       "seeAlso": [
         "http://www.affero.org/oagpl.html"
       ]
@@ -250,7 +262,7 @@
       "licenseId": "AGPL-3.0",
       "name": "GNU Affero General Public License v3.0",
       "reference": "https://spdx.org/licenses/AGPL-3.0.html",
-      "referenceNumber": 427,
+      "referenceNumber": 90,
       "seeAlso": [
         "https://www.gnu.org/licenses/agpl.txt",
         "https://opensource.org/licenses/AGPL-3.0"
@@ -264,7 +276,7 @@
       "licenseId": "AGPL-3.0-only",
       "name": "GNU Affero General Public License v3.0 only",
       "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
-      "referenceNumber": 191,
+      "referenceNumber": 687,
       "seeAlso": [
         "https://www.gnu.org/licenses/agpl.txt",
         "https://opensource.org/licenses/AGPL-3.0"
@@ -278,7 +290,7 @@
       "licenseId": "AGPL-3.0-or-later",
       "name": "GNU Affero General Public License v3.0 or later",
       "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
-      "referenceNumber": 469,
+      "referenceNumber": 380,
       "seeAlso": [
         "https://www.gnu.org/licenses/agpl.txt",
         "https://opensource.org/licenses/AGPL-3.0"
@@ -292,11 +304,21 @@
       "licenseId": "Aladdin",
       "name": "Aladdin Free Public License",
       "reference": "https://spdx.org/licenses/Aladdin.html",
-      "referenceNumber": 495,
+      "referenceNumber": 700,
       "seeAlso": [
         "http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.01/Public.htm"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ALGLIB-Documentation.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "ALGLIB-Documentation",
+      "name": "ALGLIB Documentation License",
+      "reference": "https://spdx.org/licenses/ALGLIB-Documentation.html",
+      "referenceNumber": 91,
+      "seeAlso": []
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/AMD-newlib.json",
       "isDeprecatedLicenseId": false,
@@ -304,7 +326,7 @@
       "licenseId": "AMD-newlib",
       "name": "AMD newlib License",
       "reference": "https://spdx.org/licenses/AMD-newlib.html",
-      "referenceNumber": 437,
+      "referenceNumber": 439,
       "seeAlso": [
         "https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/libc/sys/a29khif/_close.S;h=04f52ae00de1dafbd9055ad8d73c5c697a3aae7f;hb=HEAD"
       ]
@@ -316,7 +338,7 @@
       "licenseId": "AMDPLPA",
       "name": "AMD's plpa_map.c License",
       "reference": "https://spdx.org/licenses/AMDPLPA.html",
-      "referenceNumber": 194,
+      "referenceNumber": 645,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AMD_plpa_map_License"
       ]
@@ -328,7 +350,7 @@
       "licenseId": "AML",
       "name": "Apple MIT License",
       "reference": "https://spdx.org/licenses/AML.html",
-      "referenceNumber": 644,
+      "referenceNumber": 615,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Apple_MIT_License"
       ]
@@ -340,7 +362,7 @@
       "licenseId": "AML-glslang",
       "name": "AML glslang variant License",
       "reference": "https://spdx.org/licenses/AML-glslang.html",
-      "referenceNumber": 439,
+      "referenceNumber": 95,
       "seeAlso": [
         "https://github.com/KhronosGroup/glslang/blob/main/LICENSE.txt#L949",
         "https://docs.omniverse.nvidia.com/install-guide/latest/common/licenses.html"
@@ -353,7 +375,7 @@
       "licenseId": "AMPAS",
       "name": "Academy of Motion Picture Arts and Sciences BSD",
       "reference": "https://spdx.org/licenses/AMPAS.html",
-      "referenceNumber": 15,
+      "referenceNumber": 260,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/BSD#AMPASBSD"
       ]
@@ -365,7 +387,7 @@
       "licenseId": "ANTLR-PD",
       "name": "ANTLR Software Rights Notice",
       "reference": "https://spdx.org/licenses/ANTLR-PD.html",
-      "referenceNumber": 25,
+      "referenceNumber": 375,
       "seeAlso": [
         "http://www.antlr2.org/license.html"
       ]
@@ -377,7 +399,7 @@
       "licenseId": "ANTLR-PD-fallback",
       "name": "ANTLR Software Rights Notice with license fallback",
       "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
-      "referenceNumber": 218,
+      "referenceNumber": 73,
       "seeAlso": [
         "http://www.antlr2.org/license.html"
       ]
@@ -389,7 +411,7 @@
       "licenseId": "any-OSI",
       "name": "Any OSI License",
       "reference": "https://spdx.org/licenses/any-OSI.html",
-      "referenceNumber": 74,
+      "referenceNumber": 347,
       "seeAlso": [
         "https://metacpan.org/pod/Exporter::Tidy#LICENSE"
       ]
@@ -401,7 +423,7 @@
       "licenseId": "any-OSI-perl-modules",
       "name": "Any OSI License - Perl Modules",
       "reference": "https://spdx.org/licenses/any-OSI-perl-modules.html",
-      "referenceNumber": 230,
+      "referenceNumber": 401,
       "seeAlso": [
         "https://metacpan.org/release/JUERD/Exporter-Tidy-0.09/view/Tidy.pm#LICENSE",
         "https://metacpan.org/pod/Qmail::Deliverable::Client#LICENSE",
@@ -416,7 +438,7 @@
       "licenseId": "Apache-1.0",
       "name": "Apache License 1.0",
       "reference": "https://spdx.org/licenses/Apache-1.0.html",
-      "referenceNumber": 379,
+      "referenceNumber": 683,
       "seeAlso": [
         "http://www.apache.org/licenses/LICENSE-1.0"
       ]
@@ -429,7 +451,7 @@
       "licenseId": "Apache-1.1",
       "name": "Apache License 1.1",
       "reference": "https://spdx.org/licenses/Apache-1.1.html",
-      "referenceNumber": 111,
+      "referenceNumber": 217,
       "seeAlso": [
         "http://apache.org/licenses/LICENSE-1.1",
         "https://opensource.org/licenses/Apache-1.1"
@@ -443,7 +465,7 @@
       "licenseId": "Apache-2.0",
       "name": "Apache License 2.0",
       "reference": "https://spdx.org/licenses/Apache-2.0.html",
-      "referenceNumber": 162,
+      "referenceNumber": 102,
       "seeAlso": [
         "https://www.apache.org/licenses/LICENSE-2.0",
         "https://opensource.org/licenses/Apache-2.0",
@@ -457,7 +479,7 @@
       "licenseId": "APAFML",
       "name": "Adobe Postscript AFM License",
       "reference": "https://spdx.org/licenses/APAFML.html",
-      "referenceNumber": 474,
+      "referenceNumber": 127,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AdobePostscriptAFM"
       ]
@@ -469,7 +491,7 @@
       "licenseId": "APL-1.0",
       "name": "Adaptive Public License 1.0",
       "reference": "https://spdx.org/licenses/APL-1.0.html",
-      "referenceNumber": 127,
+      "referenceNumber": 155,
       "seeAlso": [
         "https://opensource.org/licenses/APL-1.0"
       ]
@@ -481,7 +503,7 @@
       "licenseId": "App-s2p",
       "name": "App::s2p License",
       "reference": "https://spdx.org/licenses/App-s2p.html",
-      "referenceNumber": 155,
+      "referenceNumber": 414,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/App-s2p"
       ]
@@ -494,7 +516,7 @@
       "licenseId": "APSL-1.0",
       "name": "Apple Public Source License 1.0",
       "reference": "https://spdx.org/licenses/APSL-1.0.html",
-      "referenceNumber": 86,
+      "referenceNumber": 694,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Apple_Public_Source_License_1.0"
       ]
@@ -506,7 +528,7 @@
       "licenseId": "APSL-1.1",
       "name": "Apple Public Source License 1.1",
       "reference": "https://spdx.org/licenses/APSL-1.1.html",
-      "referenceNumber": 23,
+      "referenceNumber": 590,
       "seeAlso": [
         "http://www.opensource.apple.com/source/IOSerialFamily/IOSerialFamily-7/APPLE_LICENSE"
       ]
@@ -518,7 +540,7 @@
       "licenseId": "APSL-1.2",
       "name": "Apple Public Source License 1.2",
       "reference": "https://spdx.org/licenses/APSL-1.2.html",
-      "referenceNumber": 265,
+      "referenceNumber": 581,
       "seeAlso": [
         "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
       ]
@@ -531,7 +553,7 @@
       "licenseId": "APSL-2.0",
       "name": "Apple Public Source License 2.0",
       "reference": "https://spdx.org/licenses/APSL-2.0.html",
-      "referenceNumber": 568,
+      "referenceNumber": 357,
       "seeAlso": [
         "http://www.opensource.apple.com/license/apsl/"
       ]
@@ -543,7 +565,7 @@
       "licenseId": "Arphic-1999",
       "name": "Arphic Public License",
       "reference": "https://spdx.org/licenses/Arphic-1999.html",
-      "referenceNumber": 649,
+      "referenceNumber": 272,
       "seeAlso": [
         "http://ftp.gnu.org/gnu/non-gnu/chinese-fonts-truetype/LICENSE"
       ]
@@ -556,7 +578,7 @@
       "licenseId": "Artistic-1.0",
       "name": "Artistic License 1.0",
       "reference": "https://spdx.org/licenses/Artistic-1.0.html",
-      "referenceNumber": 388,
+      "referenceNumber": 377,
       "seeAlso": [
         "https://opensource.org/licenses/Artistic-1.0"
       ]
@@ -568,7 +590,7 @@
       "licenseId": "Artistic-1.0-cl8",
       "name": "Artistic License 1.0 w/clause 8",
       "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
-      "referenceNumber": 291,
+      "referenceNumber": 477,
       "seeAlso": [
         "https://opensource.org/licenses/Artistic-1.0"
       ]
@@ -580,7 +602,7 @@
       "licenseId": "Artistic-1.0-Perl",
       "name": "Artistic License 1.0 (Perl)",
       "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
-      "referenceNumber": 20,
+      "referenceNumber": 409,
       "seeAlso": [
         "http://dev.perl.org/licenses/artistic.html"
       ]
@@ -593,7 +615,7 @@
       "licenseId": "Artistic-2.0",
       "name": "Artistic License 2.0",
       "reference": "https://spdx.org/licenses/Artistic-2.0.html",
-      "referenceNumber": 217,
+      "referenceNumber": 631,
       "seeAlso": [
         "http://www.perlfoundation.org/artistic_license_2_0",
         "https://www.perlfoundation.org/artistic-license-20.html",
@@ -607,7 +629,7 @@
       "licenseId": "Artistic-dist",
       "name": "Artistic License 1.0 (dist)",
       "reference": "https://spdx.org/licenses/Artistic-dist.html",
-      "referenceNumber": 511,
+      "referenceNumber": 605,
       "seeAlso": [
         "https://github.com/pexip/os-perl/blob/833cf4c86cc465ccfc627ff16db67e783156a248/debian/copyright#L2720-L2845"
       ]
@@ -619,7 +641,7 @@
       "licenseId": "Aspell-RU",
       "name": "Aspell Russian License",
       "reference": "https://spdx.org/licenses/Aspell-RU.html",
-      "referenceNumber": 231,
+      "referenceNumber": 350,
       "seeAlso": [
         "https://ftp.gnu.org/gnu/aspell/dict/ru/aspell6-ru-0.99f7-1.tar.bz2"
       ]
@@ -631,7 +653,7 @@
       "licenseId": "ASWF-Digital-Assets-1.0",
       "name": "ASWF Digital Assets License version 1.0",
       "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.html",
-      "referenceNumber": 340,
+      "referenceNumber": 190,
       "seeAlso": [
         "https://github.com/AcademySoftwareFoundation/foundation/blob/main/digital_assets/aswf_digital_assets_license_v1.0.txt"
       ]
@@ -643,7 +665,7 @@
       "licenseId": "ASWF-Digital-Assets-1.1",
       "name": "ASWF Digital Assets License 1.1",
       "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.html",
-      "referenceNumber": 153,
+      "referenceNumber": 610,
       "seeAlso": [
         "https://github.com/AcademySoftwareFoundation/foundation/blob/main/digital_assets/aswf_digital_assets_license_v1.1.txt"
       ]
@@ -655,7 +677,7 @@
       "licenseId": "Baekmuk",
       "name": "Baekmuk License",
       "reference": "https://spdx.org/licenses/Baekmuk.html",
-      "referenceNumber": 311,
+      "referenceNumber": 564,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:Baekmuk?rd=Licensing/Baekmuk"
       ]
@@ -667,7 +689,7 @@
       "licenseId": "Bahyph",
       "name": "Bahyph License",
       "reference": "https://spdx.org/licenses/Bahyph.html",
-      "referenceNumber": 505,
+      "referenceNumber": 525,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Bahyph"
       ]
@@ -679,7 +701,7 @@
       "licenseId": "Barr",
       "name": "Barr License",
       "reference": "https://spdx.org/licenses/Barr.html",
-      "referenceNumber": 420,
+      "referenceNumber": 543,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Barr"
       ]
@@ -691,7 +713,7 @@
       "licenseId": "bcrypt-Solar-Designer",
       "name": "bcrypt Solar Designer License",
       "reference": "https://spdx.org/licenses/bcrypt-Solar-Designer.html",
-      "referenceNumber": 167,
+      "referenceNumber": 494,
       "seeAlso": [
         "https://github.com/bcrypt-ruby/bcrypt-ruby/blob/master/ext/mri/crypt_blowfish.c"
       ]
@@ -703,7 +725,7 @@
       "licenseId": "Beerware",
       "name": "Beerware License",
       "reference": "https://spdx.org/licenses/Beerware.html",
-      "referenceNumber": 556,
+      "referenceNumber": 429,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Beerware",
         "https://people.freebsd.org/~phk/"
@@ -716,7 +738,7 @@
       "licenseId": "Bitstream-Charter",
       "name": "Bitstream Charter Font License",
       "reference": "https://spdx.org/licenses/Bitstream-Charter.html",
-      "referenceNumber": 47,
+      "referenceNumber": 216,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Charter#License_Text",
         "https://raw.githubusercontent.com/blackhole89/notekit/master/data/fonts/Charter%20license.txt"
@@ -729,7 +751,7 @@
       "licenseId": "Bitstream-Vera",
       "name": "Bitstream Vera Font License",
       "reference": "https://spdx.org/licenses/Bitstream-Vera.html",
-      "referenceNumber": 208,
+      "referenceNumber": 680,
       "seeAlso": [
         "https://web.archive.org/web/20080207013128/http://www.gnome.org/fonts/",
         "https://docubrain.com/sites/default/files/licenses/bitstream-vera.html"
@@ -742,7 +764,7 @@
       "licenseId": "BitTorrent-1.0",
       "name": "BitTorrent Open Source License v1.0",
       "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
-      "referenceNumber": 156,
+      "referenceNumber": 224,
       "seeAlso": [
         "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/licenses/BitTorrent?r1=1.1&r2=1.1.1.1&diff_format=s"
       ]
@@ -755,7 +777,7 @@
       "licenseId": "BitTorrent-1.1",
       "name": "BitTorrent Open Source License v1.1",
       "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
-      "referenceNumber": 325,
+      "referenceNumber": 352,
       "seeAlso": [
         "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
       ]
@@ -767,7 +789,7 @@
       "licenseId": "blessing",
       "name": "SQLite Blessing",
       "reference": "https://spdx.org/licenses/blessing.html",
-      "referenceNumber": 680,
+      "referenceNumber": 617,
       "seeAlso": [
         "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln=4-9",
         "https://sqlite.org/src/artifact/df5091916dbb40e6"
@@ -780,7 +802,7 @@
       "licenseId": "BlueOak-1.0.0",
       "name": "Blue Oak Model License 1.0.0",
       "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
-      "referenceNumber": 51,
+      "referenceNumber": 515,
       "seeAlso": [
         "https://blueoakcouncil.org/license/1.0.0"
       ]
@@ -792,7 +814,7 @@
       "licenseId": "Boehm-GC",
       "name": "Boehm-Demers-Weiser GC License",
       "reference": "https://spdx.org/licenses/Boehm-GC.html",
-      "referenceNumber": 92,
+      "referenceNumber": 251,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:MIT#Another_Minimal_variant_(found_in_libatomic_ops)",
         "https://github.com/uim/libgcroots/blob/master/COPYING",
@@ -806,11 +828,23 @@
       "licenseId": "Boehm-GC-without-fee",
       "name": "Boehm-Demers-Weiser GC License (without fee)",
       "reference": "https://spdx.org/licenses/Boehm-GC-without-fee.html",
-      "referenceNumber": 466,
+      "referenceNumber": 580,
       "seeAlso": [
         "https://github.com/MariaDB/server/blob/11.6/libmysqld/lib_sql.cc"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/BOLA-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "BOLA-1.1",
+      "name": "Buena Onda License Agreement v1.1",
+      "reference": "https://spdx.org/licenses/BOLA-1.1.html",
+      "referenceNumber": 606,
+      "seeAlso": [
+        "https://blitiri.com.ar/p/bola/"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/Borceux.json",
       "isDeprecatedLicenseId": false,
@@ -818,7 +852,7 @@
       "licenseId": "Borceux",
       "name": "Borceux license",
       "reference": "https://spdx.org/licenses/Borceux.html",
-      "referenceNumber": 335,
+      "referenceNumber": 81,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Borceux"
       ]
@@ -830,7 +864,7 @@
       "licenseId": "Brian-Gladman-2-Clause",
       "name": "Brian Gladman 2-Clause License",
       "reference": "https://spdx.org/licenses/Brian-Gladman-2-Clause.html",
-      "referenceNumber": 198,
+      "referenceNumber": 522,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L140-L156",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
@@ -843,7 +877,7 @@
       "licenseId": "Brian-Gladman-3-Clause",
       "name": "Brian Gladman 3-Clause License",
       "reference": "https://spdx.org/licenses/Brian-Gladman-3-Clause.html",
-      "referenceNumber": 675,
+      "referenceNumber": 476,
       "seeAlso": [
         "https://github.com/SWI-Prolog/packages-clib/blob/master/sha1/brg_endian.h"
       ]
@@ -855,7 +889,7 @@
       "licenseId": "BSD-1-Clause",
       "name": "BSD 1-Clause License",
       "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
-      "referenceNumber": 286,
+      "referenceNumber": 718,
       "seeAlso": [
         "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=326823"
       ]
@@ -868,7 +902,7 @@
       "licenseId": "BSD-2-Clause",
       "name": "BSD 2-Clause \"Simplified\" License",
       "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
-      "referenceNumber": 430,
+      "referenceNumber": 431,
       "seeAlso": [
         "https://opensource.org/licenses/BSD-2-Clause"
       ]
@@ -880,7 +914,7 @@
       "licenseId": "BSD-2-Clause-Darwin",
       "name": "BSD 2-Clause - Ian Darwin variant",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-Darwin.html",
-      "referenceNumber": 477,
+      "referenceNumber": 244,
       "seeAlso": [
         "https://github.com/file/file/blob/master/COPYING"
       ]
@@ -892,7 +926,7 @@
       "licenseId": "BSD-2-Clause-first-lines",
       "name": "BSD 2-Clause - first lines requirement",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-first-lines.html",
-      "referenceNumber": 543,
+      "referenceNumber": 524,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L664-L690",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
@@ -906,7 +940,7 @@
       "licenseId": "BSD-2-Clause-FreeBSD",
       "name": "BSD 2-Clause FreeBSD License",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html",
-      "referenceNumber": 622,
+      "referenceNumber": 537,
       "seeAlso": [
         "http://www.freebsd.org/copyright/freebsd-license.html"
       ]
@@ -919,7 +953,7 @@
       "licenseId": "BSD-2-Clause-NetBSD",
       "name": "BSD 2-Clause NetBSD License",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
-      "referenceNumber": 531,
+      "referenceNumber": 707,
       "seeAlso": [
         "http://www.netbsd.org/about/redistribution.html#default"
       ]
@@ -931,7 +965,7 @@
       "licenseId": "BSD-2-Clause-Patent",
       "name": "BSD-2-Clause Plus Patent License",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
-      "referenceNumber": 584,
+      "referenceNumber": 305,
       "seeAlso": [
         "https://opensource.org/licenses/BSDplusPatent"
       ]
@@ -943,7 +977,7 @@
       "licenseId": "BSD-2-Clause-pkgconf-disclaimer",
       "name": "BSD 2-Clause pkgconf disclaimer variant",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-pkgconf-disclaimer.html",
-      "referenceNumber": 624,
+      "referenceNumber": 29,
       "seeAlso": [
         "https://github.com/audacious-media-player/audacious/blob/master/src/audacious/main.cc",
         "https://github.com/audacious-media-player/audacious/blob/master/COPYING"
@@ -956,7 +990,7 @@
       "licenseId": "BSD-2-Clause-Views",
       "name": "BSD 2-Clause with views sentence",
       "reference": "https://spdx.org/licenses/BSD-2-Clause-Views.html",
-      "referenceNumber": 536,
+      "referenceNumber": 316,
       "seeAlso": [
         "http://www.freebsd.org/copyright/freebsd-license.html",
         "https://people.freebsd.org/~ivoras/wine/patch-wine-nvidia.sh",
@@ -971,7 +1005,7 @@
       "licenseId": "BSD-3-Clause",
       "name": "BSD 3-Clause \"New\" or \"Revised\" License",
       "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
-      "referenceNumber": 567,
+      "referenceNumber": 290,
       "seeAlso": [
         "https://opensource.org/licenses/BSD-3-Clause",
         "https://www.eclipse.org/org/documents/edl-v10.php"
@@ -984,7 +1018,7 @@
       "licenseId": "BSD-3-Clause-acpica",
       "name": "BSD 3-Clause acpica variant",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-acpica.html",
-      "referenceNumber": 277,
+      "referenceNumber": 5,
       "seeAlso": [
         "https://github.com/acpica/acpica/blob/master/source/common/acfileio.c#L119"
       ]
@@ -996,7 +1030,7 @@
       "licenseId": "BSD-3-Clause-Attribution",
       "name": "BSD with attribution",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.html",
-      "referenceNumber": 159,
+      "referenceNumber": 575,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/BSD_with_Attribution"
       ]
@@ -1009,7 +1043,7 @@
       "licenseId": "BSD-3-Clause-Clear",
       "name": "BSD 3-Clause Clear License",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
-      "referenceNumber": 259,
+      "referenceNumber": 579,
       "seeAlso": [
         "http://labs.metacarta.com/license-explanation.html#license"
       ]
@@ -1021,7 +1055,7 @@
       "licenseId": "BSD-3-Clause-flex",
       "name": "BSD 3-Clause Flex variant",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-flex.html",
-      "referenceNumber": 205,
+      "referenceNumber": 318,
       "seeAlso": [
         "https://github.com/westes/flex/blob/master/COPYING"
       ]
@@ -1033,7 +1067,7 @@
       "licenseId": "BSD-3-Clause-HP",
       "name": "Hewlett-Packard BSD variant license",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-HP.html",
-      "referenceNumber": 643,
+      "referenceNumber": 317,
       "seeAlso": [
         "https://github.com/zdohnal/hplip/blob/master/COPYING#L939"
       ]
@@ -1045,7 +1079,7 @@
       "licenseId": "BSD-3-Clause-LBNL",
       "name": "Lawrence Berkeley National Labs BSD variant license",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
-      "referenceNumber": 6,
+      "referenceNumber": 54,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/LBNLBSD"
       ]
@@ -1057,7 +1091,7 @@
       "licenseId": "BSD-3-Clause-Modification",
       "name": "BSD 3-Clause Modification",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.html",
-      "referenceNumber": 497,
+      "referenceNumber": 408,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Variant"
       ]
@@ -1069,7 +1103,7 @@
       "licenseId": "BSD-3-Clause-No-Military-License",
       "name": "BSD 3-Clause No Military License",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-License.html",
-      "referenceNumber": 498,
+      "referenceNumber": 199,
       "seeAlso": [
         "https://gitlab.syncad.com/hive/dhive/-/blob/master/LICENSE",
         "https://github.com/greymass/swift-eosio/blob/master/LICENSE"
@@ -1082,7 +1116,7 @@
       "licenseId": "BSD-3-Clause-No-Nuclear-License",
       "name": "BSD 3-Clause No Nuclear License",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-License.html",
-      "referenceNumber": 108,
+      "referenceNumber": 398,
       "seeAlso": [
         "http://download.oracle.com/otn-pub/java/licenses/bsd.txt"
       ]
@@ -1094,7 +1128,7 @@
       "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
       "name": "BSD 3-Clause No Nuclear License 2014",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-License-2014.html",
-      "referenceNumber": 239,
+      "referenceNumber": 459,
       "seeAlso": [
         "https://java.net/projects/javaeetutorial/pages/BerkeleyLicense"
       ]
@@ -1106,7 +1140,7 @@
       "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
       "name": "BSD 3-Clause No Nuclear Warranty",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Warranty.html",
-      "referenceNumber": 606,
+      "referenceNumber": 601,
       "seeAlso": [
         "https://jogamp.org/git/?p=gluegen.git;a=blob_plain;f=LICENSE.txt"
       ]
@@ -1114,11 +1148,11 @@
     {
       "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.json",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
+      "isOsiApproved": true,
       "licenseId": "BSD-3-Clause-Open-MPI",
       "name": "BSD 3-Clause Open MPI variant",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html",
-      "referenceNumber": 637,
+      "referenceNumber": 489,
       "seeAlso": [
         "https://www.open-mpi.org/community/license.php",
         "http://www.netlib.org/lapack/LICENSE.txt"
@@ -1131,11 +1165,23 @@
       "licenseId": "BSD-3-Clause-Sun",
       "name": "BSD 3-Clause Sun Microsystems",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-Sun.html",
-      "referenceNumber": 240,
+      "referenceNumber": 337,
       "seeAlso": [
         "https://github.com/xmlark/msv/blob/b9316e2f2270bc1606952ea4939ec87fbba157f3/xsdlib/src/main/java/com/sun/msv/datatype/regexp/InternalImpl.java"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Tso.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-Tso",
+      "name": "BSD 3-Clause Tso variant",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Tso.html",
+      "referenceNumber": 650,
+      "seeAlso": [
+        "https://www.x.org/archive/current/doc/xorg-docs/License.html#Theodore_Tso"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause.json",
       "isDeprecatedLicenseId": false,
@@ -1144,9 +1190,10 @@
       "licenseId": "BSD-4-Clause",
       "name": "BSD 4-Clause \"Original\" or \"Old\" License",
       "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
-      "referenceNumber": 227,
+      "referenceNumber": 294,
       "seeAlso": [
-        "http://directory.fsf.org/wiki/License:BSD_4Clause"
+        "http://directory.fsf.org/wiki/License:BSD_4Clause",
+        "https://github.com/jsommers/pytricia/blob/master/patricia.c#L33-L67"
       ]
     },
     {
@@ -1156,7 +1203,7 @@
       "licenseId": "BSD-4-Clause-Shortened",
       "name": "BSD 4 Clause Shortened",
       "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.html",
-      "referenceNumber": 269,
+      "referenceNumber": 214,
       "seeAlso": [
         "https://metadata.ftp-master.debian.org/changelogs//main/a/arpwatch/arpwatch_2.1a15-7_copyright"
       ]
@@ -1168,7 +1215,7 @@
       "licenseId": "BSD-4-Clause-UC",
       "name": "BSD-4-Clause (University of California-Specific)",
       "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
-      "referenceNumber": 21,
+      "referenceNumber": 343,
       "seeAlso": [
         "http://www.freebsd.org/copyright/license.html"
       ]
@@ -1180,7 +1227,7 @@
       "licenseId": "BSD-4.3RENO",
       "name": "BSD 4.3 RENO License",
       "reference": "https://spdx.org/licenses/BSD-4.3RENO.html",
-      "referenceNumber": 434,
+      "referenceNumber": 229,
       "seeAlso": [
         "https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=libiberty/strcasecmp.c;h=131d81c2ce7881fa48c363dc5bf5fb302c61ce0b;hb=HEAD",
         "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRIGHT#L55-63"
@@ -1193,7 +1240,7 @@
       "licenseId": "BSD-4.3TAHOE",
       "name": "BSD 4.3 TAHOE License",
       "reference": "https://spdx.org/licenses/BSD-4.3TAHOE.html",
-      "referenceNumber": 685,
+      "referenceNumber": 497,
       "seeAlso": [
         "https://github.com/389ds/389-ds-base/blob/main/ldap/include/sysexits-compat.h#L15",
         "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.texi?id=a74c6b4ee49397cf330b333da1042bffa60ed14f#n1788"
@@ -1206,7 +1253,7 @@
       "licenseId": "BSD-Advertising-Acknowledgement",
       "name": "BSD Advertising Acknowledgement License",
       "reference": "https://spdx.org/licenses/BSD-Advertising-Acknowledgement.html",
-      "referenceNumber": 345,
+      "referenceNumber": 150,
       "seeAlso": [
         "https://github.com/python-excel/xlrd/blob/master/LICENSE#L33"
       ]
@@ -1218,7 +1265,7 @@
       "licenseId": "BSD-Attribution-HPND-disclaimer",
       "name": "BSD with Attribution and HPND disclaimer",
       "reference": "https://spdx.org/licenses/BSD-Attribution-HPND-disclaimer.html",
-      "referenceNumber": 506,
+      "referenceNumber": 534,
       "seeAlso": [
         "https://github.com/cyrusimap/cyrus-sasl/blob/master/COPYING"
       ]
@@ -1230,11 +1277,23 @@
       "licenseId": "BSD-Inferno-Nettverk",
       "name": "BSD-Inferno-Nettverk",
       "reference": "https://spdx.org/licenses/BSD-Inferno-Nettverk.html",
-      "referenceNumber": 535,
+      "referenceNumber": 583,
       "seeAlso": [
         "https://www.inet.no/dante/LICENSE"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/BSD-Mark-Modifications.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "BSD-Mark-Modifications",
+      "name": "BSD Mark Modifications License",
+      "reference": "https://spdx.org/licenses/BSD-Mark-Modifications.html",
+      "referenceNumber": 128,
+      "seeAlso": [
+        "https://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-2020.12.07-0.tar.bz2"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
       "isDeprecatedLicenseId": false,
@@ -1242,7 +1301,7 @@
       "licenseId": "BSD-Protection",
       "name": "BSD Protection License",
       "reference": "https://spdx.org/licenses/BSD-Protection.html",
-      "referenceNumber": 163,
+      "referenceNumber": 339,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License"
       ]
@@ -1254,7 +1313,7 @@
       "licenseId": "BSD-Source-beginning-file",
       "name": "BSD Source Code Attribution - beginning of file variant",
       "reference": "https://spdx.org/licenses/BSD-Source-beginning-file.html",
-      "referenceNumber": 383,
+      "referenceNumber": 722,
       "seeAlso": [
         "https://github.com/lattera/freebsd/blob/master/sys/cam/cam.c#L4"
       ]
@@ -1266,7 +1325,7 @@
       "licenseId": "BSD-Source-Code",
       "name": "BSD Source Code Attribution",
       "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
-      "referenceNumber": 450,
+      "referenceNumber": 86,
       "seeAlso": [
         "https://github.com/robbiehanson/CocoaHTTPServer/blob/master/LICENSE.txt"
       ]
@@ -1278,7 +1337,7 @@
       "licenseId": "BSD-Systemics",
       "name": "Systemics BSD variant license",
       "reference": "https://spdx.org/licenses/BSD-Systemics.html",
-      "referenceNumber": 602,
+      "referenceNumber": 448,
       "seeAlso": [
         "https://metacpan.org/release/DPARIS/Crypt-DES-2.07/source/COPYRIGHT"
       ]
@@ -1290,7 +1349,7 @@
       "licenseId": "BSD-Systemics-W3Works",
       "name": "Systemics W3Works BSD variant license",
       "reference": "https://spdx.org/licenses/BSD-Systemics-W3Works.html",
-      "referenceNumber": 422,
+      "referenceNumber": 445,
       "seeAlso": [
         "https://metacpan.org/release/DPARIS/Crypt-Blowfish-2.14/source/COPYRIGHT#L7"
       ]
@@ -1303,12 +1362,24 @@
       "licenseId": "BSL-1.0",
       "name": "Boost Software License 1.0",
       "reference": "https://spdx.org/licenses/BSL-1.0.html",
-      "referenceNumber": 130,
+      "referenceNumber": 591,
       "seeAlso": [
         "http://www.boost.org/LICENSE_1_0.txt",
         "https://opensource.org/licenses/BSL-1.0"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Buddy.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Buddy",
+      "name": "Buddy License",
+      "reference": "https://spdx.org/licenses/Buddy.html",
+      "referenceNumber": 355,
+      "seeAlso": [
+        "https://sourceforge.net/p/buddy/gitcode/ci/master/tree/README"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/BUSL-1.1.json",
       "isDeprecatedLicenseId": false,
@@ -1316,7 +1387,7 @@
       "licenseId": "BUSL-1.1",
       "name": "Business Source License 1.1",
       "reference": "https://spdx.org/licenses/BUSL-1.1.html",
-      "referenceNumber": 234,
+      "referenceNumber": 333,
       "seeAlso": [
         "https://mariadb.com/bsl11/"
       ]
@@ -1328,7 +1399,7 @@
       "licenseId": "bzip2-1.0.5",
       "name": "bzip2 and libbzip2 License v1.0.5",
       "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
-      "referenceNumber": 412,
+      "referenceNumber": 598,
       "seeAlso": [
         "https://sourceware.org/bzip2/1.0.5/bzip2-manual-1.0.5.html",
         "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
@@ -1341,7 +1412,7 @@
       "licenseId": "bzip2-1.0.6",
       "name": "bzip2 and libbzip2 License v1.0.6",
       "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
-      "referenceNumber": 243,
+      "referenceNumber": 599,
       "seeAlso": [
         "https://sourceware.org/git/?p=bzip2.git;a=blob;f=LICENSE;hb=bzip2-1.0.6",
         "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html",
@@ -1355,7 +1426,7 @@
       "licenseId": "C-UDA-1.0",
       "name": "Computational Use of Data Agreement v1.0",
       "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
-      "referenceNumber": 660,
+      "referenceNumber": 383,
       "seeAlso": [
         "https://github.com/microsoft/Computational-Use-of-Data-Agreement/blob/master/C-UDA-1.0.md",
         "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
@@ -1368,7 +1439,7 @@
       "licenseId": "CAL-1.0",
       "name": "Cryptographic Autonomy License 1.0",
       "reference": "https://spdx.org/licenses/CAL-1.0.html",
-      "referenceNumber": 305,
+      "referenceNumber": 22,
       "seeAlso": [
         "http://cryptographicautonomylicense.com/license-text.html",
         "https://opensource.org/licenses/CAL-1.0"
@@ -1381,7 +1452,7 @@
       "licenseId": "CAL-1.0-Combined-Work-Exception",
       "name": "Cryptographic Autonomy License 1.0 (Combined Work Exception)",
       "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exception.html",
-      "referenceNumber": 569,
+      "referenceNumber": 363,
       "seeAlso": [
         "http://cryptographicautonomylicense.com/license-text.html",
         "https://opensource.org/licenses/CAL-1.0"
@@ -1394,7 +1465,7 @@
       "licenseId": "Caldera",
       "name": "Caldera License",
       "reference": "https://spdx.org/licenses/Caldera.html",
-      "referenceNumber": 483,
+      "referenceNumber": 202,
       "seeAlso": [
         "http://www.lemis.com/grog/UNIX/ancient-source-all.pdf"
       ]
@@ -1406,11 +1477,23 @@
       "licenseId": "Caldera-no-preamble",
       "name": "Caldera License (without preamble)",
       "reference": "https://spdx.org/licenses/Caldera-no-preamble.html",
-      "referenceNumber": 401,
+      "referenceNumber": 430,
       "seeAlso": [
         "https://github.com/apache/apr/blob/trunk/LICENSE#L298C6-L298C29"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CAPEC-tou.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "CAPEC-tou",
+      "name": "Common Attack    Pattern Enumeration and Classification License",
+      "reference": "https://spdx.org/licenses/CAPEC-tou.html",
+      "referenceNumber": 621,
+      "seeAlso": [
+        "https://capec.mitre.org/about/termsofuse.html"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/Catharon.json",
       "isDeprecatedLicenseId": false,
@@ -1418,7 +1501,7 @@
       "licenseId": "Catharon",
       "name": "Catharon License",
       "reference": "https://spdx.org/licenses/Catharon.html",
-      "referenceNumber": 581,
+      "referenceNumber": 14,
       "seeAlso": [
         "https://github.com/scummvm/scummvm/blob/v2.8.0/LICENSES/CatharonLicense.txt"
       ]
@@ -1430,7 +1513,7 @@
       "licenseId": "CATOSL-1.1",
       "name": "Computer Associates Trusted Open Source License 1.1",
       "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
-      "referenceNumber": 97,
+      "referenceNumber": 76,
       "seeAlso": [
         "https://opensource.org/licenses/CATOSL-1.1"
       ]
@@ -1442,7 +1525,7 @@
       "licenseId": "CC-BY-1.0",
       "name": "Creative Commons Attribution 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
-      "referenceNumber": 559,
+      "referenceNumber": 387,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/1.0/legalcode"
       ]
@@ -1454,7 +1537,7 @@
       "licenseId": "CC-BY-2.0",
       "name": "Creative Commons Attribution 2.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
-      "referenceNumber": 441,
+      "referenceNumber": 697,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/2.0/legalcode"
       ]
@@ -1466,7 +1549,7 @@
       "licenseId": "CC-BY-2.5",
       "name": "Creative Commons Attribution 2.5 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
-      "referenceNumber": 292,
+      "referenceNumber": 12,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/2.5/legalcode"
       ]
@@ -1478,7 +1561,7 @@
       "licenseId": "CC-BY-2.5-AU",
       "name": "Creative Commons Attribution 2.5 Australia",
       "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
-      "referenceNumber": 126,
+      "referenceNumber": 237,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/2.5/au/legalcode"
       ]
@@ -1490,7 +1573,7 @@
       "licenseId": "CC-BY-3.0",
       "name": "Creative Commons Attribution 3.0 Unported",
       "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
-      "referenceNumber": 576,
+      "referenceNumber": 32,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/legalcode"
       ]
@@ -1502,7 +1585,7 @@
       "licenseId": "CC-BY-3.0-AT",
       "name": "Creative Commons Attribution 3.0 Austria",
       "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
-      "referenceNumber": 107,
+      "referenceNumber": 535,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/at/legalcode"
       ]
@@ -1514,7 +1597,7 @@
       "licenseId": "CC-BY-3.0-AU",
       "name": "Creative Commons Attribution 3.0 Australia",
       "reference": "https://spdx.org/licenses/CC-BY-3.0-AU.html",
-      "referenceNumber": 648,
+      "referenceNumber": 416,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/au/legalcode"
       ]
@@ -1526,7 +1609,7 @@
       "licenseId": "CC-BY-3.0-DE",
       "name": "Creative Commons Attribution 3.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
-      "referenceNumber": 458,
+      "referenceNumber": 4,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/de/legalcode"
       ]
@@ -1538,7 +1621,7 @@
       "licenseId": "CC-BY-3.0-IGO",
       "name": "Creative Commons Attribution 3.0 IGO",
       "reference": "https://spdx.org/licenses/CC-BY-3.0-IGO.html",
-      "referenceNumber": 410,
+      "referenceNumber": 46,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/igo/legalcode"
       ]
@@ -1550,7 +1633,7 @@
       "licenseId": "CC-BY-3.0-NL",
       "name": "Creative Commons Attribution 3.0 Netherlands",
       "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
-      "referenceNumber": 436,
+      "referenceNumber": 161,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/nl/legalcode"
       ]
@@ -1562,7 +1645,7 @@
       "licenseId": "CC-BY-3.0-US",
       "name": "Creative Commons Attribution 3.0 United States",
       "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
-      "referenceNumber": 366,
+      "referenceNumber": 709,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/us/legalcode"
       ]
@@ -1575,7 +1658,7 @@
       "licenseId": "CC-BY-4.0",
       "name": "Creative Commons Attribution 4.0 International",
       "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
-      "referenceNumber": 66,
+      "referenceNumber": 640,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/4.0/legalcode"
       ]
@@ -1588,7 +1671,7 @@
       "licenseId": "CC-BY-NC-1.0",
       "name": "Creative Commons Attribution Non Commercial 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
-      "referenceNumber": 428,
+      "referenceNumber": 701,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/1.0/legalcode"
       ]
@@ -1601,7 +1684,7 @@
       "licenseId": "CC-BY-NC-2.0",
       "name": "Creative Commons Attribution Non Commercial 2.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
-      "referenceNumber": 553,
+      "referenceNumber": 157,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/2.0/legalcode"
       ]
@@ -1614,7 +1697,7 @@
       "licenseId": "CC-BY-NC-2.5",
       "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
-      "referenceNumber": 49,
+      "referenceNumber": 321,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/2.5/legalcode"
       ]
@@ -1627,7 +1710,7 @@
       "licenseId": "CC-BY-NC-3.0",
       "name": "Creative Commons Attribution Non Commercial 3.0 Unported",
       "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
-      "referenceNumber": 686,
+      "referenceNumber": 587,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/3.0/legalcode"
       ]
@@ -1639,7 +1722,7 @@
       "licenseId": "CC-BY-NC-3.0-DE",
       "name": "Creative Commons Attribution Non Commercial 3.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
-      "referenceNumber": 324,
+      "referenceNumber": 492,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/3.0/de/legalcode"
       ]
@@ -1652,7 +1735,7 @@
       "licenseId": "CC-BY-NC-4.0",
       "name": "Creative Commons Attribution Non Commercial 4.0 International",
       "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
-      "referenceNumber": 560,
+      "referenceNumber": 417,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
       ]
@@ -1664,7 +1747,7 @@
       "licenseId": "CC-BY-NC-ND-1.0",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
-      "referenceNumber": 442,
+      "referenceNumber": 507,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd-nc/1.0/legalcode"
       ]
@@ -1676,7 +1759,7 @@
       "licenseId": "CC-BY-NC-ND-2.0",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 2.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
-      "referenceNumber": 334,
+      "referenceNumber": 638,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/2.0/legalcode"
       ]
@@ -1688,7 +1771,7 @@
       "licenseId": "CC-BY-NC-ND-2.5",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 2.5 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
-      "referenceNumber": 215,
+      "referenceNumber": 475,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
       ]
@@ -1700,7 +1783,7 @@
       "licenseId": "CC-BY-NC-ND-3.0",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 3.0 Unported",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
-      "referenceNumber": 94,
+      "referenceNumber": 600,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
       ]
@@ -1712,7 +1795,7 @@
       "licenseId": "CC-BY-NC-ND-3.0-DE",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 3.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
-      "referenceNumber": 185,
+      "referenceNumber": 528,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/3.0/de/legalcode"
       ]
@@ -1724,7 +1807,7 @@
       "licenseId": "CC-BY-NC-ND-3.0-IGO",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 3.0 IGO",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
-      "referenceNumber": 577,
+      "referenceNumber": 400,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/3.0/igo/legalcode"
       ]
@@ -1736,7 +1819,7 @@
       "licenseId": "CC-BY-NC-ND-4.0",
       "name": "Creative Commons Attribution Non Commercial No Derivatives 4.0 International",
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
-      "referenceNumber": 53,
+      "referenceNumber": 551,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
       ]
@@ -1748,7 +1831,7 @@
       "licenseId": "CC-BY-NC-SA-1.0",
       "name": "Creative Commons Attribution Non Commercial Share Alike 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
-      "referenceNumber": 510,
+      "referenceNumber": 171,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/1.0/legalcode"
       ]
@@ -1760,7 +1843,7 @@
       "licenseId": "CC-BY-NC-SA-2.0",
       "name": "Creative Commons Attribution Non Commercial Share Alike 2.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
-      "referenceNumber": 199,
+      "referenceNumber": 545,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode"
       ]
@@ -1772,7 +1855,7 @@
       "licenseId": "CC-BY-NC-SA-2.0-DE",
       "name": "Creative Commons Attribution Non Commercial Share Alike 2.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.html",
-      "referenceNumber": 356,
+      "referenceNumber": 206,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/de/legalcode"
       ]
@@ -1784,7 +1867,7 @@
       "licenseId": "CC-BY-NC-SA-2.0-FR",
       "name": "Creative Commons Attribution-NonCommercial-ShareAlike 2.0 France",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
-      "referenceNumber": 301,
+      "referenceNumber": 246,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/fr/legalcode"
       ]
@@ -1796,7 +1879,7 @@
       "licenseId": "CC-BY-NC-SA-2.0-UK",
       "name": "Creative Commons Attribution Non Commercial Share Alike 2.0 England and Wales",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
-      "referenceNumber": 671,
+      "referenceNumber": 205,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/uk/legalcode"
       ]
@@ -1808,7 +1891,7 @@
       "licenseId": "CC-BY-NC-SA-2.5",
       "name": "Creative Commons Attribution Non Commercial Share Alike 2.5 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
-      "referenceNumber": 659,
+      "referenceNumber": 124,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.5/legalcode"
       ]
@@ -1820,7 +1903,7 @@
       "licenseId": "CC-BY-NC-SA-3.0",
       "name": "Creative Commons Attribution Non Commercial Share Alike 3.0 Unported",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
-      "referenceNumber": 359,
+      "referenceNumber": 255,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
       ]
@@ -1832,7 +1915,7 @@
       "licenseId": "CC-BY-NC-SA-3.0-DE",
       "name": "Creative Commons Attribution Non Commercial Share Alike 3.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
-      "referenceNumber": 279,
+      "referenceNumber": 212,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode"
       ]
@@ -1844,7 +1927,7 @@
       "licenseId": "CC-BY-NC-SA-3.0-IGO",
       "name": "Creative Commons Attribution Non Commercial Share Alike 3.0 IGO",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
-      "referenceNumber": 636,
+      "referenceNumber": 234,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/3.0/igo/legalcode"
       ]
@@ -1856,7 +1939,7 @@
       "licenseId": "CC-BY-NC-SA-4.0",
       "name": "Creative Commons Attribution Non Commercial Share Alike 4.0 International",
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
-      "referenceNumber": 89,
+      "referenceNumber": 284,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
       ]
@@ -1869,7 +1952,7 @@
       "licenseId": "CC-BY-ND-1.0",
       "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
-      "referenceNumber": 118,
+      "referenceNumber": 117,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
       ]
@@ -1882,7 +1965,7 @@
       "licenseId": "CC-BY-ND-2.0",
       "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
-      "referenceNumber": 587,
+      "referenceNumber": 20,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
       ]
@@ -1895,7 +1978,7 @@
       "licenseId": "CC-BY-ND-2.5",
       "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
-      "referenceNumber": 394,
+      "referenceNumber": 249,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/2.5/legalcode"
       ]
@@ -1908,7 +1991,7 @@
       "licenseId": "CC-BY-ND-3.0",
       "name": "Creative Commons Attribution No Derivatives 3.0 Unported",
       "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
-      "referenceNumber": 457,
+      "referenceNumber": 243,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/3.0/legalcode"
       ]
@@ -1920,7 +2003,7 @@
       "licenseId": "CC-BY-ND-3.0-DE",
       "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
-      "referenceNumber": 610,
+      "referenceNumber": 570,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
       ]
@@ -1933,7 +2016,7 @@
       "licenseId": "CC-BY-ND-4.0",
       "name": "Creative Commons Attribution No Derivatives 4.0 International",
       "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
-      "referenceNumber": 11,
+      "referenceNumber": 487,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/4.0/legalcode"
       ]
@@ -1945,7 +2028,7 @@
       "licenseId": "CC-BY-SA-1.0",
       "name": "Creative Commons Attribution Share Alike 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
-      "referenceNumber": 384,
+      "referenceNumber": 558,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/1.0/legalcode"
       ]
@@ -1957,7 +2040,7 @@
       "licenseId": "CC-BY-SA-2.0",
       "name": "Creative Commons Attribution Share Alike 2.0 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
-      "referenceNumber": 260,
+      "referenceNumber": 620,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.0/legalcode"
       ]
@@ -1969,7 +2052,7 @@
       "licenseId": "CC-BY-SA-2.0-UK",
       "name": "Creative Commons Attribution Share Alike 2.0 England and Wales",
       "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
-      "referenceNumber": 197,
+      "referenceNumber": 35,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.0/uk/legalcode"
       ]
@@ -1981,7 +2064,7 @@
       "licenseId": "CC-BY-SA-2.1-JP",
       "name": "Creative Commons Attribution Share Alike 2.1 Japan",
       "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
-      "referenceNumber": 149,
+      "referenceNumber": 221,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
       ]
@@ -1993,7 +2076,7 @@
       "licenseId": "CC-BY-SA-2.5",
       "name": "Creative Commons Attribution Share Alike 2.5 Generic",
       "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
-      "referenceNumber": 631,
+      "referenceNumber": 100,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.5/legalcode"
       ]
@@ -2005,7 +2088,7 @@
       "licenseId": "CC-BY-SA-3.0",
       "name": "Creative Commons Attribution Share Alike 3.0 Unported",
       "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
-      "referenceNumber": 79,
+      "referenceNumber": 457,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/legalcode"
       ]
@@ -2017,7 +2100,7 @@
       "licenseId": "CC-BY-SA-3.0-AT",
       "name": "Creative Commons Attribution Share Alike 3.0 Austria",
       "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
-      "referenceNumber": 493,
+      "referenceNumber": 92,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
       ]
@@ -2029,7 +2112,7 @@
       "licenseId": "CC-BY-SA-3.0-DE",
       "name": "Creative Commons Attribution Share Alike 3.0 Germany",
       "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
-      "referenceNumber": 683,
+      "referenceNumber": 177,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
       ]
@@ -2041,7 +2124,7 @@
       "licenseId": "CC-BY-SA-3.0-IGO",
       "name": "Creative Commons Attribution-ShareAlike 3.0 IGO",
       "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.html",
-      "referenceNumber": 571,
+      "referenceNumber": 358,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/igo/legalcode"
       ]
@@ -2054,7 +2137,7 @@
       "licenseId": "CC-BY-SA-4.0",
       "name": "Creative Commons Attribution Share Alike 4.0 International",
       "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
-      "referenceNumber": 256,
+      "referenceNumber": 89,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
       ]
@@ -2066,7 +2149,7 @@
       "licenseId": "CC-PDDC",
       "name": "Creative Commons Public Domain Dedication and Certification",
       "reference": "https://spdx.org/licenses/CC-PDDC.html",
-      "referenceNumber": 273,
+      "referenceNumber": 574,
       "seeAlso": [
         "https://creativecommons.org/licenses/publicdomain/"
       ]
@@ -2078,7 +2161,7 @@
       "licenseId": "CC-PDM-1.0",
       "name": "Creative    Commons Public Domain Mark 1.0 Universal",
       "reference": "https://spdx.org/licenses/CC-PDM-1.0.html",
-      "referenceNumber": 547,
+      "referenceNumber": 25,
       "seeAlso": [
         "https://creativecommons.org/publicdomain/mark/1.0/",
         "https://creativecommons.org/share-your-work/cclicenses/"
@@ -2091,7 +2174,7 @@
       "licenseId": "CC-SA-1.0",
       "name": "Creative Commons Share Alike 1.0 Generic",
       "reference": "https://spdx.org/licenses/CC-SA-1.0.html",
-      "referenceNumber": 85,
+      "referenceNumber": 681,
       "seeAlso": [
         "https://creativecommons.org/licenses/sa/1.0/legalcode"
       ]
@@ -2104,7 +2187,7 @@
       "licenseId": "CC0-1.0",
       "name": "Creative Commons Zero v1.0 Universal",
       "reference": "https://spdx.org/licenses/CC0-1.0.html",
-      "referenceNumber": 369,
+      "referenceNumber": 195,
       "seeAlso": [
         "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
       ]
@@ -2117,7 +2200,7 @@
       "licenseId": "CDDL-1.0",
       "name": "Common Development and Distribution License 1.0",
       "reference": "https://spdx.org/licenses/CDDL-1.0.html",
-      "referenceNumber": 407,
+      "referenceNumber": 67,
       "seeAlso": [
         "https://opensource.org/licenses/cddl1"
       ]
@@ -2129,7 +2212,7 @@
       "licenseId": "CDDL-1.1",
       "name": "Common Development and Distribution License 1.1",
       "reference": "https://spdx.org/licenses/CDDL-1.1.html",
-      "referenceNumber": 124,
+      "referenceNumber": 662,
       "seeAlso": [
         "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
         "https://javaee.github.io/glassfish/LICENSE"
@@ -2142,7 +2225,7 @@
       "licenseId": "CDL-1.0",
       "name": "Common Documentation License 1.0",
       "reference": "https://spdx.org/licenses/CDL-1.0.html",
-      "referenceNumber": 385,
+      "referenceNumber": 87,
       "seeAlso": [
         "http://www.opensource.apple.com/cdl/",
         "https://fedoraproject.org/wiki/Licensing/Common_Documentation_License",
@@ -2156,7 +2239,7 @@
       "licenseId": "CDLA-Permissive-1.0",
       "name": "Community Data License Agreement Permissive 1.0",
       "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
-      "referenceNumber": 454,
+      "referenceNumber": 28,
       "seeAlso": [
         "https://cdla.io/permissive-1-0"
       ]
@@ -2168,7 +2251,7 @@
       "licenseId": "CDLA-Permissive-2.0",
       "name": "Community Data License Agreement Permissive 2.0",
       "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
-      "referenceNumber": 520,
+      "referenceNumber": 340,
       "seeAlso": [
         "https://cdla.dev/permissive-2-0"
       ]
@@ -2180,7 +2263,7 @@
       "licenseId": "CDLA-Sharing-1.0",
       "name": "Community Data License Agreement Sharing 1.0",
       "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
-      "referenceNumber": 548,
+      "referenceNumber": 567,
       "seeAlso": [
         "https://cdla.io/sharing-1-0"
       ]
@@ -2192,7 +2275,7 @@
       "licenseId": "CECILL-1.0",
       "name": "CeCILL Free Software License Agreement v1.0",
       "reference": "https://spdx.org/licenses/CECILL-1.0.html",
-      "referenceNumber": 468,
+      "referenceNumber": 208,
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
       ]
@@ -2204,7 +2287,7 @@
       "licenseId": "CECILL-1.1",
       "name": "CeCILL Free Software License Agreement v1.1",
       "reference": "https://spdx.org/licenses/CECILL-1.1.html",
-      "referenceNumber": 100,
+      "referenceNumber": 248,
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
       ]
@@ -2217,7 +2300,7 @@
       "licenseId": "CECILL-2.0",
       "name": "CeCILL Free Software License Agreement v2.0",
       "reference": "https://spdx.org/licenses/CECILL-2.0.html",
-      "referenceNumber": 370,
+      "referenceNumber": 713,
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"
       ]
@@ -2229,7 +2312,7 @@
       "licenseId": "CECILL-2.1",
       "name": "CeCILL Free Software License Agreement v2.1",
       "reference": "https://spdx.org/licenses/CECILL-2.1.html",
-      "referenceNumber": 95,
+      "referenceNumber": 144,
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
       ]
@@ -2242,7 +2325,7 @@
       "licenseId": "CECILL-B",
       "name": "CeCILL-B Free Software License Agreement",
       "reference": "https://spdx.org/licenses/CECILL-B.html",
-      "referenceNumber": 425,
+      "referenceNumber": 188,
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html"
       ]
@@ -2255,7 +2338,7 @@
       "licenseId": "CECILL-C",
       "name": "CeCILL-C Free Software License Agreement",
       "reference": "https://spdx.org/licenses/CECILL-C.html",
-      "referenceNumber": 45,
+      "referenceNumber": 186,
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
       ]
@@ -2267,7 +2350,7 @@
       "licenseId": "CERN-OHL-1.1",
       "name": "CERN Open Hardware Licence v1.1",
       "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
-      "referenceNumber": 398,
+      "referenceNumber": 167,
       "seeAlso": [
         "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
       ]
@@ -2279,7 +2362,7 @@
       "licenseId": "CERN-OHL-1.2",
       "name": "CERN Open Hardware Licence v1.2",
       "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
-      "referenceNumber": 318,
+      "referenceNumber": 450,
       "seeAlso": [
         "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
       ]
@@ -2291,7 +2374,7 @@
       "licenseId": "CERN-OHL-P-2.0",
       "name": "CERN Open Hardware Licence Version 2 - Permissive",
       "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
-      "referenceNumber": 200,
+      "referenceNumber": 646,
       "seeAlso": [
         "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2"
       ]
@@ -2303,7 +2386,7 @@
       "licenseId": "CERN-OHL-S-2.0",
       "name": "CERN Open Hardware Licence Version 2 - Strongly Reciprocal",
       "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
-      "referenceNumber": 175,
+      "referenceNumber": 619,
       "seeAlso": [
         "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2"
       ]
@@ -2315,7 +2398,7 @@
       "licenseId": "CERN-OHL-W-2.0",
       "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal",
       "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
-      "referenceNumber": 219,
+      "referenceNumber": 544,
       "seeAlso": [
         "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2"
       ]
@@ -2327,7 +2410,7 @@
       "licenseId": "CFITSIO",
       "name": "CFITSIO License",
       "reference": "https://spdx.org/licenses/CFITSIO.html",
-      "referenceNumber": 207,
+      "referenceNumber": 693,
       "seeAlso": [
         "https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/f_user/node9.html",
         "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fv/doc/license.html"
@@ -2340,7 +2423,7 @@
       "licenseId": "check-cvs",
       "name": "check-cvs License",
       "reference": "https://spdx.org/licenses/check-cvs.html",
-      "referenceNumber": 377,
+      "referenceNumber": 63,
       "seeAlso": [
         "http://cvs.savannah.gnu.org/viewvc/cvs/ccvs/contrib/check_cvs.in?revision=1.1.4.3&view=markup&pathrev=cvs1-11-23#l2"
       ]
@@ -2352,7 +2435,7 @@
       "licenseId": "checkmk",
       "name": "Checkmk License",
       "reference": "https://spdx.org/licenses/checkmk.html",
-      "referenceNumber": 389,
+      "referenceNumber": 415,
       "seeAlso": [
         "https://github.com/libcheck/check/blob/master/checkmk/checkmk.in"
       ]
@@ -2365,7 +2448,7 @@
       "licenseId": "ClArtistic",
       "name": "Clarified Artistic License",
       "reference": "https://spdx.org/licenses/ClArtistic.html",
-      "referenceNumber": 690,
+      "referenceNumber": 502,
       "seeAlso": [
         "http://gianluca.dellavedova.org/2011/01/03/clarified-artistic-license/",
         "http://www.ncftp.com/ncftp/doc/LICENSE.txt"
@@ -2378,7 +2461,7 @@
       "licenseId": "Clips",
       "name": "Clips License",
       "reference": "https://spdx.org/licenses/Clips.html",
-      "referenceNumber": 65,
+      "referenceNumber": 210,
       "seeAlso": [
         "https://github.com/DrItanium/maya/blob/master/LICENSE.CLIPS"
       ]
@@ -2390,7 +2473,7 @@
       "licenseId": "CMU-Mach",
       "name": "CMU Mach License",
       "reference": "https://spdx.org/licenses/CMU-Mach.html",
-      "referenceNumber": 178,
+      "referenceNumber": 41,
       "seeAlso": [
         "https://www.cs.cmu.edu/~410/licenses.html"
       ]
@@ -2402,7 +2485,7 @@
       "licenseId": "CMU-Mach-nodoc",
       "name": "CMU    Mach - no notices-in-documentation variant",
       "reference": "https://spdx.org/licenses/CMU-Mach-nodoc.html",
-      "referenceNumber": 391,
+      "referenceNumber": 26,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L718-L728",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
@@ -2415,7 +2498,7 @@
       "licenseId": "CNRI-Jython",
       "name": "CNRI Jython License",
       "reference": "https://spdx.org/licenses/CNRI-Jython.html",
-      "referenceNumber": 138,
+      "referenceNumber": 396,
       "seeAlso": [
         "http://www.jython.org/license.html"
       ]
@@ -2427,7 +2510,7 @@
       "licenseId": "CNRI-Python",
       "name": "CNRI Python License",
       "reference": "https://spdx.org/licenses/CNRI-Python.html",
-      "referenceNumber": 352,
+      "referenceNumber": 236,
       "seeAlso": [
         "https://opensource.org/licenses/CNRI-Python"
       ]
@@ -2439,7 +2522,7 @@
       "licenseId": "CNRI-Python-GPL-Compatible",
       "name": "CNRI Python Open Source GPL Compatible License Agreement",
       "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.html",
-      "referenceNumber": 673,
+      "referenceNumber": 69,
       "seeAlso": [
         "http://www.python.org/download/releases/1.6.1/download_win/"
       ]
@@ -2451,7 +2534,7 @@
       "licenseId": "COIL-1.0",
       "name": "Copyfree Open Innovation License",
       "reference": "https://spdx.org/licenses/COIL-1.0.html",
-      "referenceNumber": 526,
+      "referenceNumber": 378,
       "seeAlso": [
         "https://coil.apotheon.org/plaintext/01.0.txt"
       ]
@@ -2463,7 +2546,7 @@
       "licenseId": "Community-Spec-1.0",
       "name": "Community Specification License 1.0",
       "reference": "https://spdx.org/licenses/Community-Spec-1.0.html",
-      "referenceNumber": 695,
+      "referenceNumber": 397,
       "seeAlso": [
         "https://github.com/CommunitySpecification/1.0/blob/master/1._Community_Specification_License-v1.md"
       ]
@@ -2476,7 +2559,7 @@
       "licenseId": "Condor-1.1",
       "name": "Condor Public License v1.1",
       "reference": "https://spdx.org/licenses/Condor-1.1.html",
-      "referenceNumber": 114,
+      "referenceNumber": 566,
       "seeAlso": [
         "http://research.cs.wisc.edu/condor/license.html#condor",
         "http://web.archive.org/web/20111123062036/http://research.cs.wisc.edu/condor/license.html#condor"
@@ -2489,7 +2572,7 @@
       "licenseId": "copyleft-next-0.3.0",
       "name": "copyleft-next 0.3.0",
       "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
-      "referenceNumber": 122,
+      "referenceNumber": 468,
       "seeAlso": [
         "https://github.com/copyleft-next/copyleft-next/blob/master/Releases/copyleft-next-0.3.0"
       ]
@@ -2501,7 +2584,7 @@
       "licenseId": "copyleft-next-0.3.1",
       "name": "copyleft-next 0.3.1",
       "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
-      "referenceNumber": 583,
+      "referenceNumber": 2,
       "seeAlso": [
         "https://github.com/copyleft-next/copyleft-next/blob/master/Releases/copyleft-next-0.3.1"
       ]
@@ -2513,7 +2596,7 @@
       "licenseId": "Cornell-Lossless-JPEG",
       "name": "Cornell Lossless JPEG License",
       "reference": "https://spdx.org/licenses/Cornell-Lossless-JPEG.html",
-      "referenceNumber": 331,
+      "referenceNumber": 385,
       "seeAlso": [
         "https://android.googlesource.com/platform/external/dng_sdk/+/refs/heads/master/source/dng_lossless_jpeg.cpp#16",
         "https://www.mssl.ucl.ac.uk/~mcrw/src/20050920/proto.h",
@@ -2528,7 +2611,7 @@
       "licenseId": "CPAL-1.0",
       "name": "Common Public Attribution License 1.0",
       "reference": "https://spdx.org/licenses/CPAL-1.0.html",
-      "referenceNumber": 147,
+      "referenceNumber": 356,
       "seeAlso": [
         "https://opensource.org/licenses/CPAL-1.0"
       ]
@@ -2541,7 +2624,7 @@
       "licenseId": "CPL-1.0",
       "name": "Common Public License 1.0",
       "reference": "https://spdx.org/licenses/CPL-1.0.html",
-      "referenceNumber": 367,
+      "referenceNumber": 585,
       "seeAlso": [
         "https://opensource.org/licenses/CPL-1.0"
       ]
@@ -2554,7 +2637,7 @@
       "licenseId": "CPOL-1.02",
       "name": "Code Project Open License 1.02",
       "reference": "https://spdx.org/licenses/CPOL-1.02.html",
-      "referenceNumber": 250,
+      "referenceNumber": 596,
       "seeAlso": [
         "http://www.codeproject.com/info/cpol10.aspx"
       ]
@@ -2566,7 +2649,7 @@
       "licenseId": "Cronyx",
       "name": "Cronyx License",
       "reference": "https://spdx.org/licenses/Cronyx.html",
-      "referenceNumber": 32,
+      "referenceNumber": 156,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/font/alias/-/blob/master/COPYING",
         "https://gitlab.freedesktop.org/xorg/font/cronyx-cyrillic/-/blob/master/COPYING",
@@ -2581,7 +2664,7 @@
       "licenseId": "Crossword",
       "name": "Crossword License",
       "reference": "https://spdx.org/licenses/Crossword.html",
-      "referenceNumber": 347,
+      "referenceNumber": 720,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Crossword"
       ]
@@ -2593,7 +2676,7 @@
       "licenseId": "CryptoSwift",
       "name": "CryptoSwift License",
       "reference": "https://spdx.org/licenses/CryptoSwift.html",
-      "referenceNumber": 323,
+      "referenceNumber": 704,
       "seeAlso": [
         "https://github.com/krzyzanowskim/CryptoSwift/blob/main/LICENSE"
       ]
@@ -2605,7 +2688,7 @@
       "licenseId": "CrystalStacker",
       "name": "CrystalStacker License",
       "reference": "https://spdx.org/licenses/CrystalStacker.html",
-      "referenceNumber": 449,
+      "referenceNumber": 461,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd=Licensing/CrystalStacker"
       ]
@@ -2617,7 +2700,7 @@
       "licenseId": "CUA-OPL-1.0",
       "name": "CUA Office Public License v1.0",
       "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
-      "referenceNumber": 298,
+      "referenceNumber": 622,
       "seeAlso": [
         "https://opensource.org/licenses/CUA-OPL-1.0"
       ]
@@ -2629,7 +2712,7 @@
       "licenseId": "Cube",
       "name": "Cube License",
       "reference": "https://spdx.org/licenses/Cube.html",
-      "referenceNumber": 140,
+      "referenceNumber": 366,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Cube"
       ]
@@ -2641,7 +2724,7 @@
       "licenseId": "curl",
       "name": "curl License",
       "reference": "https://spdx.org/licenses/curl.html",
-      "referenceNumber": 160,
+      "referenceNumber": 215,
       "seeAlso": [
         "https://github.com/bagder/curl/blob/master/COPYING"
       ]
@@ -2653,7 +2736,7 @@
       "licenseId": "cve-tou",
       "name": "Common Vulnerability Enumeration ToU License",
       "reference": "https://spdx.org/licenses/cve-tou.html",
-      "referenceNumber": 216,
+      "referenceNumber": 614,
       "seeAlso": [
         "https://www.cve.org/Legal/TermsOfUse"
       ]
@@ -2665,7 +2748,7 @@
       "licenseId": "D-FSL-1.0",
       "name": "Deutsche Freie Software Lizenz",
       "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
-      "referenceNumber": 545,
+      "referenceNumber": 168,
       "seeAlso": [
         "http://www.dipp.nrw.de/d-fsl/lizenzen/",
         "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/de/D-FSL-1_0_de.txt",
@@ -2684,7 +2767,7 @@
       "licenseId": "DEC-3-Clause",
       "name": "DEC 3-Clause License",
       "reference": "https://spdx.org/licenses/DEC-3-Clause.html",
-      "referenceNumber": 164,
+      "referenceNumber": 140,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYING?ref_type=heads#L239"
       ]
@@ -2696,7 +2779,7 @@
       "licenseId": "diffmark",
       "name": "diffmark license",
       "reference": "https://spdx.org/licenses/diffmark.html",
-      "referenceNumber": 50,
+      "referenceNumber": 463,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/diffmark"
       ]
@@ -2708,7 +2791,7 @@
       "licenseId": "DL-DE-BY-2.0",
       "name": "Data licence Germany \u2013 attribution \u2013 version 2.0",
       "reference": "https://spdx.org/licenses/DL-DE-BY-2.0.html",
-      "referenceNumber": 530,
+      "referenceNumber": 261,
       "seeAlso": [
         "https://www.govdata.de/dl-de/by-2-0"
       ]
@@ -2720,7 +2803,7 @@
       "licenseId": "DL-DE-ZERO-2.0",
       "name": "Data licence Germany \u2013 zero \u2013 version 2.0",
       "reference": "https://spdx.org/licenses/DL-DE-ZERO-2.0.html",
-      "referenceNumber": 139,
+      "referenceNumber": 43,
       "seeAlso": [
         "https://www.govdata.de/dl-de/zero-2-0"
       ]
@@ -2732,7 +2815,7 @@
       "licenseId": "DOC",
       "name": "DOC License",
       "reference": "https://spdx.org/licenses/DOC.html",
-      "referenceNumber": 31,
+      "referenceNumber": 562,
       "seeAlso": [
         "http://www.cs.wustl.edu/~schmidt/ACE-copying.html",
         "https://www.dre.vanderbilt.edu/~schmidt/ACE-copying.html"
@@ -2745,7 +2828,7 @@
       "licenseId": "DocBook-DTD",
       "name": "DocBook DTD License",
       "reference": "https://spdx.org/licenses/DocBook-DTD.html",
-      "referenceNumber": 603,
+      "referenceNumber": 74,
       "seeAlso": [
         "http://www.docbook.org/xml/simple/1.1/docbook-simple-1.1.zip"
       ]
@@ -2757,7 +2840,7 @@
       "licenseId": "DocBook-Schema",
       "name": "DocBook Schema License",
       "reference": "https://spdx.org/licenses/DocBook-Schema.html",
-      "referenceNumber": 184,
+      "referenceNumber": 702,
       "seeAlso": [
         "https://github.com/docbook/xslt10-stylesheets/blob/efd62655c11cc8773708df7a843613fa1e932bf8/xsl/assembly/schema/docbook51b7.rnc"
       ]
@@ -2769,7 +2852,7 @@
       "licenseId": "DocBook-Stylesheet",
       "name": "DocBook Stylesheet License",
       "reference": "https://spdx.org/licenses/DocBook-Stylesheet.html",
-      "referenceNumber": 494,
+      "referenceNumber": 643,
       "seeAlso": [
         "http://www.docbook.org/xml/5.0/docbook-5.0.zip"
       ]
@@ -2781,7 +2864,7 @@
       "licenseId": "DocBook-XML",
       "name": "DocBook XML License",
       "reference": "https://spdx.org/licenses/DocBook-XML.html",
-      "referenceNumber": 672,
+      "referenceNumber": 572,
       "seeAlso": [
         "https://github.com/docbook/xslt10-stylesheets/blob/efd62655c11cc8773708df7a843613fa1e932bf8/xsl/COPYING#L27"
       ]
@@ -2793,7 +2876,7 @@
       "licenseId": "Dotseqn",
       "name": "Dotseqn License",
       "reference": "https://spdx.org/licenses/Dotseqn.html",
-      "referenceNumber": 257,
+      "referenceNumber": 584,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Dotseqn"
       ]
@@ -2805,7 +2888,7 @@
       "licenseId": "DRL-1.0",
       "name": "Detection Rule License 1.0",
       "reference": "https://spdx.org/licenses/DRL-1.0.html",
-      "referenceNumber": 446,
+      "referenceNumber": 577,
       "seeAlso": [
         "https://github.com/Neo23x0/sigma/blob/master/LICENSE.Detection.Rules.md"
       ]
@@ -2817,7 +2900,7 @@
       "licenseId": "DRL-1.1",
       "name": "Detection Rule License 1.1",
       "reference": "https://spdx.org/licenses/DRL-1.1.html",
-      "referenceNumber": 135,
+      "referenceNumber": 711,
       "seeAlso": [
         "https://github.com/SigmaHQ/Detection-Rule-License/blob/6ec7fbde6101d101b5b5d1fcb8f9b69fbc76c04a/LICENSE.Detection.Rules.md"
       ]
@@ -2829,7 +2912,7 @@
       "licenseId": "DSDP",
       "name": "DSDP License",
       "reference": "https://spdx.org/licenses/DSDP.html",
-      "referenceNumber": 336,
+      "referenceNumber": 509,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/DSDP"
       ]
@@ -2841,7 +2924,7 @@
       "licenseId": "dtoa",
       "name": "David M. Gay dtoa License",
       "reference": "https://spdx.org/licenses/dtoa.html",
-      "referenceNumber": 578,
+      "referenceNumber": 484,
       "seeAlso": [
         "https://github.com/SWI-Prolog/swipl-devel/blob/master/src/os/dtoa.c",
         "https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/libc/stdlib/mprec.h;hb=HEAD"
@@ -2854,7 +2937,7 @@
       "licenseId": "dvipdfm",
       "name": "dvipdfm License",
       "reference": "https://spdx.org/licenses/dvipdfm.html",
-      "referenceNumber": 319,
+      "referenceNumber": 553,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/dvipdfm"
       ]
@@ -2866,7 +2949,7 @@
       "licenseId": "ECL-1.0",
       "name": "Educational Community License v1.0",
       "reference": "https://spdx.org/licenses/ECL-1.0.html",
-      "referenceNumber": 641,
+      "referenceNumber": 129,
       "seeAlso": [
         "https://opensource.org/licenses/ECL-1.0"
       ]
@@ -2879,7 +2962,7 @@
       "licenseId": "ECL-2.0",
       "name": "Educational Community License v2.0",
       "reference": "https://spdx.org/licenses/ECL-2.0.html",
-      "referenceNumber": 338,
+      "referenceNumber": 118,
       "seeAlso": [
         "https://opensource.org/licenses/ECL-2.0"
       ]
@@ -2892,7 +2975,7 @@
       "licenseId": "eCos-2.0",
       "name": "eCos license version 2.0",
       "reference": "https://spdx.org/licenses/eCos-2.0.html",
-      "referenceNumber": 647,
+      "referenceNumber": 165,
       "seeAlso": [
         "https://www.gnu.org/licenses/ecos-license.html"
       ]
@@ -2904,7 +2987,7 @@
       "licenseId": "EFL-1.0",
       "name": "Eiffel Forum License v1.0",
       "reference": "https://spdx.org/licenses/EFL-1.0.html",
-      "referenceNumber": 145,
+      "referenceNumber": 51,
       "seeAlso": [
         "http://www.eiffel-nice.org/license/forum.txt",
         "https://opensource.org/licenses/EFL-1.0"
@@ -2918,7 +3001,7 @@
       "licenseId": "EFL-2.0",
       "name": "Eiffel Forum License v2.0",
       "reference": "https://spdx.org/licenses/EFL-2.0.html",
-      "referenceNumber": 604,
+      "referenceNumber": 265,
       "seeAlso": [
         "http://www.eiffel-nice.org/license/eiffel-forum-license-2.html",
         "https://opensource.org/licenses/EFL-2.0"
@@ -2931,7 +3014,7 @@
       "licenseId": "eGenix",
       "name": "eGenix.com Public License 1.1.0",
       "reference": "https://spdx.org/licenses/eGenix.html",
-      "referenceNumber": 613,
+      "referenceNumber": 688,
       "seeAlso": [
         "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.pdf",
         "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_License_1.1.0"
@@ -2944,7 +3027,7 @@
       "licenseId": "Elastic-2.0",
       "name": "Elastic License 2.0",
       "reference": "https://spdx.org/licenses/Elastic-2.0.html",
-      "referenceNumber": 396,
+      "referenceNumber": 160,
       "seeAlso": [
         "https://www.elastic.co/licensing/elastic-license",
         "https://github.com/elastic/elasticsearch/blob/master/licenses/ELASTIC-LICENSE-2.0.txt"
@@ -2957,7 +3040,7 @@
       "licenseId": "Entessa",
       "name": "Entessa Public License v1.0",
       "reference": "https://spdx.org/licenses/Entessa.html",
-      "referenceNumber": 40,
+      "referenceNumber": 116,
       "seeAlso": [
         "https://opensource.org/licenses/Entessa"
       ]
@@ -2969,7 +3052,7 @@
       "licenseId": "EPICS",
       "name": "EPICS Open License",
       "reference": "https://spdx.org/licenses/EPICS.html",
-      "referenceNumber": 158,
+      "referenceNumber": 315,
       "seeAlso": [
         "https://epics.anl.gov/license/open.php"
       ]
@@ -2982,7 +3065,7 @@
       "licenseId": "EPL-1.0",
       "name": "Eclipse Public License 1.0",
       "reference": "https://spdx.org/licenses/EPL-1.0.html",
-      "referenceNumber": 558,
+      "referenceNumber": 103,
       "seeAlso": [
         "http://www.eclipse.org/legal/epl-v10.html",
         "https://opensource.org/licenses/EPL-1.0"
@@ -2996,7 +3079,7 @@
       "licenseId": "EPL-2.0",
       "name": "Eclipse Public License 2.0",
       "reference": "https://spdx.org/licenses/EPL-2.0.html",
-      "referenceNumber": 326,
+      "referenceNumber": 520,
       "seeAlso": [
         "https://www.eclipse.org/legal/epl-2.0",
         "https://www.opensource.org/licenses/EPL-2.0",
@@ -3011,11 +3094,47 @@
       "licenseId": "ErlPL-1.1",
       "name": "Erlang Public License v1.1",
       "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
-      "referenceNumber": 541,
+      "referenceNumber": 692,
       "seeAlso": [
         "http://www.erlang.org/EPLICENSE"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ESA-PL-permissive-2.4.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ESA-PL-permissive-2.4",
+      "name": "European Space Agency Public License \u2013 v2.4 \u2013 Permissive (Type 3)",
+      "reference": "https://spdx.org/licenses/ESA-PL-permissive-2.4.html",
+      "referenceNumber": 435,
+      "seeAlso": [
+        "https://essr.esa.int/license/european-space-agency-public-license-v2-4-permissive-type-3"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ESA-PL-strong-copyleft-2.4.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ESA-PL-strong-copyleft-2.4",
+      "name": "European Space Agency Public License (ESA-PL) - V2.4 - Strong Copyleft (Type 1)",
+      "reference": "https://spdx.org/licenses/ESA-PL-strong-copyleft-2.4.html",
+      "referenceNumber": 493,
+      "seeAlso": [
+        "https://essr.esa.int/license/european-space-agency-public-license-v2-4-strong-copyleft-type-1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ESA-PL-weak-copyleft-2.4.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ESA-PL-weak-copyleft-2.4",
+      "name": "European Space Agency Public License \u2013 v2.4 \u2013 Weak Copyleft (Type 2)",
+      "reference": "https://spdx.org/licenses/ESA-PL-weak-copyleft-2.4.html",
+      "referenceNumber": 309,
+      "seeAlso": [
+        "https://essr.esa.int/license/european-space-agency-public-license-v2-4-weak-copyleft-type-2"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
       "isDeprecatedLicenseId": false,
@@ -3023,7 +3142,7 @@
       "licenseId": "etalab-2.0",
       "name": "Etalab Open License 2.0",
       "reference": "https://spdx.org/licenses/etalab-2.0.html",
-      "referenceNumber": 363,
+      "referenceNumber": 211,
       "seeAlso": [
         "https://github.com/DISIC/politique-de-contribution-open-source/blob/master/LICENSE.pdf",
         "https://raw.githubusercontent.com/DISIC/politique-de-contribution-open-source/master/LICENSE"
@@ -3037,7 +3156,7 @@
       "licenseId": "EUDatagrid",
       "name": "EU DataGrid Software License",
       "reference": "https://spdx.org/licenses/EUDatagrid.html",
-      "referenceNumber": 262,
+      "referenceNumber": 565,
       "seeAlso": [
         "http://eu-datagrid.web.cern.ch/eu-datagrid/license.html",
         "https://opensource.org/licenses/EUDatagrid"
@@ -3050,7 +3169,7 @@
       "licenseId": "EUPL-1.0",
       "name": "European Union Public License 1.0",
       "reference": "https://spdx.org/licenses/EUPL-1.0.html",
-      "referenceNumber": 405,
+      "referenceNumber": 288,
       "seeAlso": [
         "http://ec.europa.eu/idabc/en/document/7330.html",
         "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id=31096"
@@ -3064,7 +3183,7 @@
       "licenseId": "EUPL-1.1",
       "name": "European Union Public License 1.1",
       "reference": "https://spdx.org/licenses/EUPL-1.1.html",
-      "referenceNumber": 393,
+      "referenceNumber": 618,
       "seeAlso": [
         "https://joinup.ec.europa.eu/software/page/eupl/licence-eupl",
         "https://joinup.ec.europa.eu/sites/default/files/custom-page/attachment/eupl1.1.-licence-en_0.pdf",
@@ -3079,7 +3198,7 @@
       "licenseId": "EUPL-1.2",
       "name": "European Union Public License 1.2",
       "reference": "https://spdx.org/licenses/EUPL-1.2.html",
-      "referenceNumber": 596,
+      "referenceNumber": 151,
       "seeAlso": [
         "https://joinup.ec.europa.eu/page/eupl-text-11-12",
         "https://joinup.ec.europa.eu/sites/default/files/custom-page/attachment/eupl_v1.2_en.pdf",
@@ -3096,7 +3215,7 @@
       "licenseId": "Eurosym",
       "name": "Eurosym License",
       "reference": "https://spdx.org/licenses/Eurosym.html",
-      "referenceNumber": 299,
+      "referenceNumber": 72,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Eurosym"
       ]
@@ -3108,7 +3227,7 @@
       "licenseId": "Fair",
       "name": "Fair License",
       "reference": "https://spdx.org/licenses/Fair.html",
-      "referenceNumber": 190,
+      "referenceNumber": 7,
       "seeAlso": [
         "https://web.archive.org/web/20150926120323/http://fairlicense.org/",
         "https://opensource.org/licenses/Fair"
@@ -3121,7 +3240,7 @@
       "licenseId": "FBM",
       "name": "Fuzzy Bitmap License",
       "reference": "https://spdx.org/licenses/FBM.html",
-      "referenceNumber": 476,
+      "referenceNumber": 424,
       "seeAlso": [
         "https://github.com/SWI-Prolog/packages-xpce/blob/161a40cd82004f731ba48024f9d30af388a7edf5/src/img/gifwrite.c#L21-L26"
       ]
@@ -3133,7 +3252,7 @@
       "licenseId": "FDK-AAC",
       "name": "Fraunhofer FDK AAC Codec Library",
       "reference": "https://spdx.org/licenses/FDK-AAC.html",
-      "referenceNumber": 44,
+      "referenceNumber": 595,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/FDK-AAC",
         "https://directory.fsf.org/wiki/License:Fdk"
@@ -3146,7 +3265,7 @@
       "licenseId": "Ferguson-Twofish",
       "name": "Ferguson Twofish License",
       "reference": "https://spdx.org/licenses/Ferguson-Twofish.html",
-      "referenceNumber": 662,
+      "referenceNumber": 512,
       "seeAlso": [
         "https://github.com/wernerd/ZRTPCPP/blob/6b3cd8e6783642292bad0c21e3e5e5ce45ff3e03/cryptcommon/twofish.c#L113C3-L127"
       ]
@@ -3158,7 +3277,7 @@
       "licenseId": "Frameworx-1.0",
       "name": "Frameworx Open License 1.0",
       "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
-      "referenceNumber": 376,
+      "referenceNumber": 395,
       "seeAlso": [
         "https://opensource.org/licenses/Frameworx-1.0"
       ]
@@ -3170,7 +3289,7 @@
       "licenseId": "FreeBSD-DOC",
       "name": "FreeBSD Documentation License",
       "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
-      "referenceNumber": 645,
+      "referenceNumber": 370,
       "seeAlso": [
         "https://www.freebsd.org/copyright/freebsd-doc-license/"
       ]
@@ -3182,7 +3301,7 @@
       "licenseId": "FreeImage",
       "name": "FreeImage Public License v1.0",
       "reference": "https://spdx.org/licenses/FreeImage.html",
-      "referenceNumber": 264,
+      "referenceNumber": 299,
       "seeAlso": [
         "http://freeimage.sourceforge.net/freeimage-license.txt"
       ]
@@ -3195,7 +3314,7 @@
       "licenseId": "FSFAP",
       "name": "FSF All Permissive License",
       "reference": "https://spdx.org/licenses/FSFAP.html",
-      "referenceNumber": 561,
+      "referenceNumber": 96,
       "seeAlso": [
         "https://www.gnu.org/prep/maintain/html_node/License-Notices-for-Other-Files.html"
       ]
@@ -3207,7 +3326,7 @@
       "licenseId": "FSFAP-no-warranty-disclaimer",
       "name": "FSF All Permissive License (without Warranty)",
       "reference": "https://spdx.org/licenses/FSFAP-no-warranty-disclaimer.html",
-      "referenceNumber": 629,
+      "referenceNumber": 223,
       "seeAlso": [
         "https://git.savannah.gnu.org/cgit/wget.git/tree/util/trunc.c?h=v1.21.3&id=40747a11e44ced5a8ac628a41f879ced3e2ebce9#n6"
       ]
@@ -3219,7 +3338,7 @@
       "licenseId": "FSFUL",
       "name": "FSF Unlimited License",
       "reference": "https://spdx.org/licenses/FSFUL.html",
-      "referenceNumber": 59,
+      "referenceNumber": 133,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License"
       ]
@@ -3231,7 +3350,7 @@
       "licenseId": "FSFULLR",
       "name": "FSF Unlimited License (with License Retention)",
       "reference": "https://spdx.org/licenses/FSFULLR.html",
-      "referenceNumber": 322,
+      "referenceNumber": 203,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#License_Retention_Variant"
       ]
@@ -3243,7 +3362,7 @@
       "licenseId": "FSFULLRSD",
       "name": "FSF Unlimited License (with License Retention and Short Disclaimer)",
       "reference": "https://spdx.org/licenses/FSFULLRSD.html",
-      "referenceNumber": 300,
+      "referenceNumber": 308,
       "seeAlso": [
         "https://git.savannah.gnu.org/cgit/gnulib.git/tree/modules/COPYING?id=7b08932179d0d6b017f7df01a2ddf6e096b038e3"
       ]
@@ -3255,7 +3374,7 @@
       "licenseId": "FSFULLRWD",
       "name": "FSF Unlimited License (With License Retention and Warranty Disclaimer)",
       "reference": "https://spdx.org/licenses/FSFULLRWD.html",
-      "referenceNumber": 245,
+      "referenceNumber": 326,
       "seeAlso": [
         "https://lists.gnu.org/archive/html/autoconf/2012-04/msg00061.html"
       ]
@@ -3267,7 +3386,7 @@
       "licenseId": "FSL-1.1-ALv2",
       "name": "Functional Source License, Version 1.1, ALv2 Future License",
       "reference": "https://spdx.org/licenses/FSL-1.1-ALv2.html",
-      "referenceNumber": 585,
+      "referenceNumber": 433,
       "seeAlso": [
         "https://fsl.software/FSL-1.1-ALv2.template.md"
       ]
@@ -3279,7 +3398,7 @@
       "licenseId": "FSL-1.1-MIT",
       "name": "Functional Source License, Version 1.1, MIT Future License",
       "reference": "https://spdx.org/licenses/FSL-1.1-MIT.html",
-      "referenceNumber": 639,
+      "referenceNumber": 0,
       "seeAlso": [
         "https://fsl.software/FSL-1.1-MIT.template.md"
       ]
@@ -3292,7 +3411,7 @@
       "licenseId": "FTL",
       "name": "Freetype Project License",
       "reference": "https://spdx.org/licenses/FTL.html",
-      "referenceNumber": 417,
+      "referenceNumber": 351,
       "seeAlso": [
         "http://freetype.fis.uniroma2.it/FTL.TXT",
         "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/FTL.TXT",
@@ -3306,7 +3425,7 @@
       "licenseId": "Furuseth",
       "name": "Furuseth License",
       "reference": "https://spdx.org/licenses/Furuseth.html",
-      "referenceNumber": 72,
+      "referenceNumber": 690,
       "seeAlso": [
         "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRIGHT?ref_type=heads#L39-51"
       ]
@@ -3318,7 +3437,7 @@
       "licenseId": "fwlw",
       "name": "fwlw License",
       "reference": "https://spdx.org/licenses/fwlw.html",
-      "referenceNumber": 529,
+      "referenceNumber": 226,
       "seeAlso": [
         "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/fwlw/README"
       ]
@@ -3330,7 +3449,7 @@
       "licenseId": "Game-Programming-Gems",
       "name": "Game Programming Gems License",
       "reference": "https://spdx.org/licenses/Game-Programming-Gems.html",
-      "referenceNumber": 246,
+      "referenceNumber": 282,
       "seeAlso": [
         "https://github.com/OGRECave/ogre/blob/master/OgreMain/include/OgreSingleton.h#L28C3-L35C46"
       ]
@@ -3342,7 +3461,7 @@
       "licenseId": "GCR-docs",
       "name": "Gnome GCR Documentation License",
       "reference": "https://spdx.org/licenses/GCR-docs.html",
-      "referenceNumber": 270,
+      "referenceNumber": 207,
       "seeAlso": [
         "https://github.com/GNOME/gcr/blob/master/docs/COPYING"
       ]
@@ -3366,7 +3485,7 @@
       "licenseId": "generic-xts",
       "name": "Generic XTS License",
       "reference": "https://spdx.org/licenses/generic-xts.html",
-      "referenceNumber": 132,
+      "referenceNumber": 131,
       "seeAlso": [
         "https://github.com/mhogomchungu/zuluCrypt/blob/master/external_libraries/tcplay/generic_xts.c"
       ]
@@ -3379,7 +3498,7 @@
       "licenseId": "GFDL-1.1",
       "name": "GNU Free Documentation License v1.1",
       "reference": "https://spdx.org/licenses/GFDL-1.1.html",
-      "referenceNumber": 533,
+      "referenceNumber": 486,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3391,7 +3510,7 @@
       "licenseId": "GFDL-1.1-invariants-only",
       "name": "GNU Free Documentation License v1.1 only - invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.html",
-      "referenceNumber": 271,
+      "referenceNumber": 588,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3403,7 +3522,7 @@
       "licenseId": "GFDL-1.1-invariants-or-later",
       "name": "GNU Free Documentation License v1.1 or later - invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-later.html",
-      "referenceNumber": 538,
+      "referenceNumber": 381,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3415,7 +3534,7 @@
       "licenseId": "GFDL-1.1-no-invariants-only",
       "name": "GNU Free Documentation License v1.1 only - no invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only.html",
-      "referenceNumber": 609,
+      "referenceNumber": 557,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3427,7 +3546,7 @@
       "licenseId": "GFDL-1.1-no-invariants-or-later",
       "name": "GNU Free Documentation License v1.1 or later - no invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-later.html",
-      "referenceNumber": 689,
+      "referenceNumber": 653,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3440,7 +3559,7 @@
       "licenseId": "GFDL-1.1-only",
       "name": "GNU Free Documentation License v1.1 only",
       "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
-      "referenceNumber": 456,
+      "referenceNumber": 327,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3453,7 +3572,7 @@
       "licenseId": "GFDL-1.1-or-later",
       "name": "GNU Free Documentation License v1.1 or later",
       "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
-      "referenceNumber": 67,
+      "referenceNumber": 434,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
       ]
@@ -3466,7 +3585,7 @@
       "licenseId": "GFDL-1.2",
       "name": "GNU Free Documentation License v1.2",
       "reference": "https://spdx.org/licenses/GFDL-1.2.html",
-      "referenceNumber": 350,
+      "referenceNumber": 30,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3478,7 +3597,7 @@
       "licenseId": "GFDL-1.2-invariants-only",
       "name": "GNU Free Documentation License v1.2 only - invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.html",
-      "referenceNumber": 192,
+      "referenceNumber": 23,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3490,7 +3609,7 @@
       "licenseId": "GFDL-1.2-invariants-or-later",
       "name": "GNU Free Documentation License v1.2 or later - invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-later.html",
-      "referenceNumber": 261,
+      "referenceNumber": 451,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3502,7 +3621,7 @@
       "licenseId": "GFDL-1.2-no-invariants-only",
       "name": "GNU Free Documentation License v1.2 only - no invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only.html",
-      "referenceNumber": 101,
+      "referenceNumber": 62,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3514,7 +3633,7 @@
       "licenseId": "GFDL-1.2-no-invariants-or-later",
       "name": "GNU Free Documentation License v1.2 or later - no invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-later.html",
-      "referenceNumber": 244,
+      "referenceNumber": 82,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3527,7 +3646,7 @@
       "licenseId": "GFDL-1.2-only",
       "name": "GNU Free Documentation License v1.2 only",
       "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
-      "referenceNumber": 595,
+      "referenceNumber": 159,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3540,7 +3659,7 @@
       "licenseId": "GFDL-1.2-or-later",
       "name": "GNU Free Documentation License v1.2 or later",
       "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
-      "referenceNumber": 488,
+      "referenceNumber": 671,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ]
@@ -3553,7 +3672,7 @@
       "licenseId": "GFDL-1.3",
       "name": "GNU Free Documentation License v1.3",
       "reference": "https://spdx.org/licenses/GFDL-1.3.html",
-      "referenceNumber": 652,
+      "referenceNumber": 499,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3565,7 +3684,7 @@
       "licenseId": "GFDL-1.3-invariants-only",
       "name": "GNU Free Documentation License v1.3 only - invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.html",
-      "referenceNumber": 69,
+      "referenceNumber": 233,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3577,7 +3696,7 @@
       "licenseId": "GFDL-1.3-invariants-or-later",
       "name": "GNU Free Documentation License v1.3 or later - invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-later.html",
-      "referenceNumber": 550,
+      "referenceNumber": 231,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3589,7 +3708,7 @@
       "licenseId": "GFDL-1.3-no-invariants-only",
       "name": "GNU Free Documentation License v1.3 only - no invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only.html",
-      "referenceNumber": 516,
+      "referenceNumber": 647,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3601,7 +3720,7 @@
       "licenseId": "GFDL-1.3-no-invariants-or-later",
       "name": "GNU Free Documentation License v1.3 or later - no invariants",
       "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-later.html",
-      "referenceNumber": 73,
+      "referenceNumber": 386,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3614,7 +3733,7 @@
       "licenseId": "GFDL-1.3-only",
       "name": "GNU Free Documentation License v1.3 only",
       "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
-      "referenceNumber": 223,
+      "referenceNumber": 184,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3627,7 +3746,7 @@
       "licenseId": "GFDL-1.3-or-later",
       "name": "GNU Free Documentation License v1.3 or later",
       "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
-      "referenceNumber": 633,
+      "referenceNumber": 58,
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
       ]
@@ -3639,7 +3758,7 @@
       "licenseId": "Giftware",
       "name": "Giftware License",
       "reference": "https://spdx.org/licenses/Giftware.html",
-      "referenceNumber": 519,
+      "referenceNumber": 428,
       "seeAlso": [
         "http://liballeg.org/license.html#allegro-4-the-giftware-license"
       ]
@@ -3651,7 +3770,7 @@
       "licenseId": "GL2PS",
       "name": "GL2PS License",
       "reference": "https://spdx.org/licenses/GL2PS.html",
-      "referenceNumber": 360,
+      "referenceNumber": 276,
       "seeAlso": [
         "http://www.geuz.org/gl2ps/COPYING.GL2PS"
       ]
@@ -3663,7 +3782,7 @@
       "licenseId": "Glide",
       "name": "3dfx Glide License",
       "reference": "https://spdx.org/licenses/Glide.html",
-      "referenceNumber": 71,
+      "referenceNumber": 716,
       "seeAlso": [
         "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
       ]
@@ -3675,7 +3794,7 @@
       "licenseId": "Glulxe",
       "name": "Glulxe License",
       "reference": "https://spdx.org/licenses/Glulxe.html",
-      "referenceNumber": 635,
+      "referenceNumber": 40,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Glulxe"
       ]
@@ -3687,7 +3806,7 @@
       "licenseId": "GLWTPL",
       "name": "Good Luck With That Public License",
       "reference": "https://spdx.org/licenses/GLWTPL.html",
-      "referenceNumber": 27,
+      "referenceNumber": 573,
       "seeAlso": [
         "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb442c0b31e33a65b9d6e85"
       ]
@@ -3700,7 +3819,7 @@
       "licenseId": "gnuplot",
       "name": "gnuplot License",
       "reference": "https://spdx.org/licenses/gnuplot.html",
-      "referenceNumber": 247,
+      "referenceNumber": 281,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Gnuplot"
       ]
@@ -3712,7 +3831,7 @@
       "licenseId": "GPL-1.0",
       "name": "GNU General Public License v1.0 only",
       "reference": "https://spdx.org/licenses/GPL-1.0.html",
-      "referenceNumber": 10,
+      "referenceNumber": 712,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
       ]
@@ -3724,7 +3843,7 @@
       "licenseId": "GPL-1.0+",
       "name": "GNU General Public License v1.0 or later",
       "reference": "https://spdx.org/licenses/GPL-1.0+.html",
-      "referenceNumber": 177,
+      "referenceNumber": 412,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
       ]
@@ -3736,7 +3855,7 @@
       "licenseId": "GPL-1.0-only",
       "name": "GNU General Public License v1.0 only",
       "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
-      "referenceNumber": 152,
+      "referenceNumber": 349,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
       ]
@@ -3748,7 +3867,7 @@
       "licenseId": "GPL-1.0-or-later",
       "name": "GNU General Public License v1.0 or later",
       "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
-      "referenceNumber": 68,
+      "referenceNumber": 526,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
       ]
@@ -3761,7 +3880,7 @@
       "licenseId": "GPL-2.0",
       "name": "GNU General Public License v2.0 only",
       "reference": "https://spdx.org/licenses/GPL-2.0.html",
-      "referenceNumber": 688,
+      "referenceNumber": 319,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
         "https://opensource.org/licenses/GPL-2.0"
@@ -3775,7 +3894,7 @@
       "licenseId": "GPL-2.0+",
       "name": "GNU General Public License v2.0 or later",
       "reference": "https://spdx.org/licenses/GPL-2.0+.html",
-      "referenceNumber": 144,
+      "referenceNumber": 21,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
         "https://opensource.org/licenses/GPL-2.0"
@@ -3789,7 +3908,7 @@
       "licenseId": "GPL-2.0-only",
       "name": "GNU General Public License v2.0 only",
       "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
-      "referenceNumber": 461,
+      "referenceNumber": 323,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt",
@@ -3805,7 +3924,7 @@
       "licenseId": "GPL-2.0-or-later",
       "name": "GNU General Public License v2.0 or later",
       "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
-      "referenceNumber": 99,
+      "referenceNumber": 491,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
         "https://opensource.org/licenses/GPL-2.0",
@@ -3819,7 +3938,7 @@
       "licenseId": "GPL-2.0-with-autoconf-exception",
       "name": "GNU General Public License v2.0 w/Autoconf exception",
       "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exception.html",
-      "referenceNumber": 618,
+      "referenceNumber": 706,
       "seeAlso": [
         "http://ac-archive.sourceforge.net/doc/copyright.html"
       ]
@@ -3831,7 +3950,7 @@
       "licenseId": "GPL-2.0-with-bison-exception",
       "name": "GNU General Public License v2.0 w/Bison exception",
       "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-exception.html",
-      "referenceNumber": 358,
+      "referenceNumber": 24,
       "seeAlso": [
         "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id=193d7c7054ba7197b0789e14965b739162319b5e#n141"
       ]
@@ -3843,7 +3962,7 @@
       "licenseId": "GPL-2.0-with-classpath-exception",
       "name": "GNU General Public License v2.0 w/Classpath exception",
       "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-exception.html",
-      "referenceNumber": 171,
+      "referenceNumber": 332,
       "seeAlso": [
         "https://www.gnu.org/software/classpath/license.html"
       ]
@@ -3855,7 +3974,7 @@
       "licenseId": "GPL-2.0-with-font-exception",
       "name": "GNU General Public License v2.0 w/Font exception",
       "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exception.html",
-      "referenceNumber": 151,
+      "referenceNumber": 322,
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-faq.html#FontException"
       ]
@@ -3867,7 +3986,7 @@
       "licenseId": "GPL-2.0-with-GCC-exception",
       "name": "GNU General Public License v2.0 w/GCC Runtime Library exception",
       "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.html",
-      "referenceNumber": 525,
+      "referenceNumber": 250,
       "seeAlso": [
         "https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/libgcc1.c;h=762f5143fc6eed57b6797c82710f3538aa52b40b;hb=cb143a3ce4fb417c68f5fa2691a1b1b1053dfba9#l10"
       ]
@@ -3880,7 +3999,7 @@
       "licenseId": "GPL-3.0",
       "name": "GNU General Public License v3.0 only",
       "reference": "https://spdx.org/licenses/GPL-3.0.html",
-      "referenceNumber": 503,
+      "referenceNumber": 164,
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
@@ -3894,7 +4013,7 @@
       "licenseId": "GPL-3.0+",
       "name": "GNU General Public License v3.0 or later",
       "reference": "https://spdx.org/licenses/GPL-3.0+.html",
-      "referenceNumber": 131,
+      "referenceNumber": 84,
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
@@ -3908,7 +4027,7 @@
       "licenseId": "GPL-3.0-only",
       "name": "GNU General Public License v3.0 only",
       "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
-      "referenceNumber": 632,
+      "referenceNumber": 410,
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
@@ -3922,7 +4041,7 @@
       "licenseId": "GPL-3.0-or-later",
       "name": "GNU General Public License v3.0 or later",
       "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
-      "referenceNumber": 467,
+      "referenceNumber": 173,
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
@@ -3935,7 +4054,7 @@
       "licenseId": "GPL-3.0-with-autoconf-exception",
       "name": "GNU General Public License v3.0 w/Autoconf exception",
       "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.html",
-      "referenceNumber": 650,
+      "referenceNumber": 666,
       "seeAlso": [
         "https://www.gnu.org/licenses/autoconf-exception-3.0.html"
       ]
@@ -3947,7 +4066,7 @@
       "licenseId": "GPL-3.0-with-GCC-exception",
       "name": "GNU General Public License v3.0 w/GCC Runtime Library exception",
       "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.html",
-      "referenceNumber": 601,
+      "referenceNumber": 554,
       "seeAlso": [
         "https://www.gnu.org/licenses/gcc-exception-3.1.html"
       ]
@@ -3959,7 +4078,7 @@
       "licenseId": "Graphics-Gems",
       "name": "Graphics Gems License",
       "reference": "https://spdx.org/licenses/Graphics-Gems.html",
-      "referenceNumber": 255,
+      "referenceNumber": 672,
       "seeAlso": [
         "https://github.com/erich666/GraphicsGems/blob/master/LICENSE.md"
       ]
@@ -3971,7 +4090,7 @@
       "licenseId": "gSOAP-1.3b",
       "name": "gSOAP Public License v1.3b",
       "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
-      "referenceNumber": 668,
+      "referenceNumber": 517,
       "seeAlso": [
         "http://www.cs.fsu.edu/~engelen/license.html"
       ]
@@ -3983,7 +4102,7 @@
       "licenseId": "gtkbook",
       "name": "gtkbook License",
       "reference": "https://spdx.org/licenses/gtkbook.html",
-      "referenceNumber": 465,
+      "referenceNumber": 99,
       "seeAlso": [
         "https://github.com/slogan621/gtkbook",
         "https://github.com/oetiker/rrdtool-1.x/blob/master/src/plbasename.c#L8-L11"
@@ -3996,7 +4115,7 @@
       "licenseId": "Gutmann",
       "name": "Gutmann License",
       "reference": "https://spdx.org/licenses/Gutmann.html",
-      "referenceNumber": 524,
+      "referenceNumber": 637,
       "seeAlso": [
         "https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c"
       ]
@@ -4008,7 +4127,7 @@
       "licenseId": "HaskellReport",
       "name": "Haskell Language Report License",
       "reference": "https://spdx.org/licenses/HaskellReport.html",
-      "referenceNumber": 605,
+      "referenceNumber": 561,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Report_License"
       ]
@@ -4020,7 +4139,7 @@
       "licenseId": "HDF5",
       "name": "HDF5 License",
       "reference": "https://spdx.org/licenses/HDF5.html",
-      "referenceNumber": 19,
+      "referenceNumber": 64,
       "seeAlso": [
         "https://github.com/HDFGroup/hdf5/?tab=License-1-ov-file#readme"
       ]
@@ -4032,7 +4151,7 @@
       "licenseId": "hdparm",
       "name": "hdparm License",
       "reference": "https://spdx.org/licenses/hdparm.html",
-      "referenceNumber": 283,
+      "referenceNumber": 252,
       "seeAlso": [
         "https://github.com/Distrotech/hdparm/blob/4517550db29a91420fb2b020349523b1b4512df2/LICENSE.TXT"
       ]
@@ -4044,7 +4163,7 @@
       "licenseId": "HIDAPI",
       "name": "HIDAPI License",
       "reference": "https://spdx.org/licenses/HIDAPI.html",
-      "referenceNumber": 310,
+      "referenceNumber": 180,
       "seeAlso": [
         "https://github.com/signal11/hidapi/blob/master/LICENSE-orig.txt"
       ]
@@ -4056,7 +4175,7 @@
       "licenseId": "Hippocratic-2.1",
       "name": "Hippocratic License 2.1",
       "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
-      "referenceNumber": 87,
+      "referenceNumber": 239,
       "seeAlso": [
         "https://firstdonoharm.dev/version/2/1/license.html",
         "https://github.com/EthicalSource/hippocratic-license/blob/58c0e646d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
@@ -4069,7 +4188,7 @@
       "licenseId": "HP-1986",
       "name": "Hewlett-Packard 1986 License",
       "reference": "https://spdx.org/licenses/HP-1986.html",
-      "referenceNumber": 282,
+      "referenceNumber": 586,
       "seeAlso": [
         "https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/libc/machine/hppa/memchr.S;h=1cca3e5e8867aa4bffef1f75a5c1bba25c0c441e;hb=HEAD#l2"
       ]
@@ -4081,7 +4200,7 @@
       "licenseId": "HP-1989",
       "name": "Hewlett-Packard 1989 License",
       "reference": "https://spdx.org/licenses/HP-1989.html",
-      "referenceNumber": 8,
+      "referenceNumber": 384,
       "seeAlso": [
         "https://github.com/bleargh45/Data-UUID/blob/master/LICENSE"
       ]
@@ -4094,7 +4213,7 @@
       "licenseId": "HPND",
       "name": "Historical Permission Notice and Disclaimer",
       "reference": "https://spdx.org/licenses/HPND.html",
-      "referenceNumber": 209,
+      "referenceNumber": 298,
       "seeAlso": [
         "https://opensource.org/licenses/HPND",
         "http://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2002-November/006304.html"
@@ -4107,7 +4226,7 @@
       "licenseId": "HPND-DEC",
       "name": "Historical Permission Notice and Disclaimer - DEC variant",
       "reference": "https://spdx.org/licenses/HPND-DEC.html",
-      "referenceNumber": 112,
+      "referenceNumber": 198,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/app/xkbcomp/-/blob/master/COPYING?ref_type=heads#L69"
       ]
@@ -4119,7 +4238,7 @@
       "licenseId": "HPND-doc",
       "name": "Historical Permission Notice and Disclaimer - documentation variant",
       "reference": "https://spdx.org/licenses/HPND-doc.html",
-      "referenceNumber": 600,
+      "referenceNumber": 235,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/COPYING?ref_type=heads#L185-197",
         "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/COPYING?ref_type=heads#L70-77"
@@ -4132,7 +4251,7 @@
       "licenseId": "HPND-doc-sell",
       "name": "Historical Permission Notice and Disclaimer - documentation sell variant",
       "reference": "https://spdx.org/licenses/HPND-doc-sell.html",
-      "referenceNumber": 306,
+      "referenceNumber": 142,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/COPYING?ref_type=heads#L108-117",
         "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/COPYING?ref_type=heads#L153-162"
@@ -4145,7 +4264,7 @@
       "licenseId": "HPND-export-US",
       "name": "HPND with US Government export control warning",
       "reference": "https://spdx.org/licenses/HPND-export-US.html",
-      "referenceNumber": 459,
+      "referenceNumber": 710,
       "seeAlso": [
         "https://www.kermitproject.org/ck90.html#source"
       ]
@@ -4157,7 +4276,7 @@
       "licenseId": "HPND-export-US-acknowledgement",
       "name": "HPND with US Government export control warning and acknowledgment",
       "reference": "https://spdx.org/licenses/HPND-export-US-acknowledgement.html",
-      "referenceNumber": 487,
+      "referenceNumber": 505,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L831-L852",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
@@ -4170,7 +4289,7 @@
       "licenseId": "HPND-export-US-modify",
       "name": "HPND with US Government export control warning and modification rqmt",
       "reference": "https://spdx.org/licenses/HPND-export-US-modify.html",
-      "referenceNumber": 172,
+      "referenceNumber": 403,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L1157-L1182",
         "https://github.com/pythongssapi/k5test/blob/v0.10.3/K5TEST-LICENSE.txt"
@@ -4183,7 +4302,7 @@
       "licenseId": "HPND-export2-US",
       "name": "HPND with US Government export control and 2 disclaimers",
       "reference": "https://spdx.org/licenses/HPND-export2-US.html",
-      "referenceNumber": 1,
+      "referenceNumber": 149,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L111-L133",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
@@ -4196,7 +4315,7 @@
       "licenseId": "HPND-Fenneberg-Livingston",
       "name": "Historical Permission Notice and Disclaimer - Fenneberg-Livingston variant",
       "reference": "https://spdx.org/licenses/HPND-Fenneberg-Livingston.html",
-      "referenceNumber": 445,
+      "referenceNumber": 529,
       "seeAlso": [
         "https://github.com/FreeRADIUS/freeradius-client/blob/master/COPYRIGHT#L32",
         "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L34"
@@ -4209,7 +4328,7 @@
       "licenseId": "HPND-INRIA-IMAG",
       "name": "Historical Permission Notice and Disclaimer    - INRIA-IMAG variant",
       "reference": "https://spdx.org/licenses/HPND-INRIA-IMAG.html",
-      "referenceNumber": 233,
+      "referenceNumber": 193,
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/ipv6cp.c#L75-L83"
       ]
@@ -4221,7 +4340,7 @@
       "licenseId": "HPND-Intel",
       "name": "Historical Permission Notice and Disclaimer - Intel variant",
       "reference": "https://spdx.org/licenses/HPND-Intel.html",
-      "referenceNumber": 228,
+      "referenceNumber": 466,
       "seeAlso": [
         "https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/libc/machine/i960/memcpy.S;hb=HEAD"
       ]
@@ -4233,7 +4352,7 @@
       "licenseId": "HPND-Kevlin-Henney",
       "name": "Historical Permission Notice and Disclaimer - Kevlin Henney variant",
       "reference": "https://spdx.org/licenses/HPND-Kevlin-Henney.html",
-      "referenceNumber": 528,
+      "referenceNumber": 218,
       "seeAlso": [
         "https://github.com/mruby/mruby/blob/83d12f8d52522cdb7c8cc46fad34821359f453e6/mrbgems/mruby-dir/src/Win/dirent.c#L127-L140"
       ]
@@ -4245,7 +4364,7 @@
       "licenseId": "HPND-Markus-Kuhn",
       "name": "Historical Permission Notice and Disclaimer - Markus Kuhn variant",
       "reference": "https://spdx.org/licenses/HPND-Markus-Kuhn.html",
-      "referenceNumber": 623,
+      "referenceNumber": 372,
       "seeAlso": [
         "https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c",
         "https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=readline/readline/support/wcwidth.c;h=0f5ec995796f4813abbcf4972aec0378ab74722a;hb=HEAD#l55"
@@ -4258,7 +4377,7 @@
       "licenseId": "HPND-merchantability-variant",
       "name": "Historical Permission Notice and Disclaimer - merchantability variant",
       "reference": "https://spdx.org/licenses/HPND-merchantability-variant.html",
-      "referenceNumber": 157,
+      "referenceNumber": 715,
       "seeAlso": [
         "https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/libc/misc/fini.c;hb=HEAD"
       ]
@@ -4270,7 +4389,7 @@
       "licenseId": "HPND-MIT-disclaimer",
       "name": "Historical Permission Notice and Disclaimer with MIT disclaimer",
       "reference": "https://spdx.org/licenses/HPND-MIT-disclaimer.html",
-      "referenceNumber": 313,
+      "referenceNumber": 253,
       "seeAlso": [
         "https://metacpan.org/release/NLNETLABS/Net-DNS-SEC-1.22/source/LICENSE"
       ]
@@ -4282,7 +4401,7 @@
       "licenseId": "HPND-Netrek",
       "name": "Historical Permission Notice and Disclaimer - Netrek variant",
       "reference": "https://spdx.org/licenses/HPND-Netrek.html",
-      "referenceNumber": 387,
+      "referenceNumber": 111,
       "seeAlso": []
     },
     {
@@ -4292,7 +4411,7 @@
       "licenseId": "HPND-Pbmplus",
       "name": "Historical Permission Notice and Disclaimer - Pbmplus variant",
       "reference": "https://spdx.org/licenses/HPND-Pbmplus.html",
-      "referenceNumber": 339,
+      "referenceNumber": 654,
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/netpbm.c#l8"
       ]
@@ -4304,7 +4423,7 @@
       "licenseId": "HPND-sell-MIT-disclaimer-xserver",
       "name": "Historical Permission Notice and Disclaimer - sell xserver variant with MIT disclaimer",
       "reference": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-xserver.html",
-      "referenceNumber": 341,
+      "referenceNumber": 301,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYING?ref_type=heads#L1781"
       ]
@@ -4316,7 +4435,7 @@
       "licenseId": "HPND-sell-regexpr",
       "name": "Historical Permission Notice and Disclaimer - sell regexpr variant",
       "reference": "https://spdx.org/licenses/HPND-sell-regexpr.html",
-      "referenceNumber": 681,
+      "referenceNumber": 668,
       "seeAlso": [
         "https://gitlab.com/bacula-org/bacula/-/blob/Branch-11.0/bacula/LICENSE-FOSS?ref_type=heads#L245"
       ]
@@ -4328,12 +4447,24 @@
       "licenseId": "HPND-sell-variant",
       "name": "Historical Permission Notice and Disclaimer - sell variant",
       "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
-      "referenceNumber": 13,
+      "referenceNumber": 209,
       "seeAlso": [
         "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/sunrpc/auth_gss/gss_generic_token.c?h=v4.19",
         "https://github.com/kfish/xsel/blob/master/COPYING"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-critical-systems.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-sell-variant-critical-systems",
+      "name": "HPND - sell variant with safety critical systems clause",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant-critical-systems.html",
+      "referenceNumber": 685,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/driver/xf86-video-voodoo/-/blob/68a5b6d98ae34749cca889f4373b4043d00bfe6a/src/voodoo_dga.c#L12-33"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-disclaimer.json",
       "isDeprecatedLicenseId": false,
@@ -4341,7 +4472,7 @@
       "licenseId": "HPND-sell-variant-MIT-disclaimer",
       "name": "HPND sell variant with MIT disclaimer",
       "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disclaimer.html",
-      "referenceNumber": 225,
+      "referenceNumber": 542,
       "seeAlso": [
         "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/README"
       ]
@@ -4353,11 +4484,23 @@
       "licenseId": "HPND-sell-variant-MIT-disclaimer-rev",
       "name": "HPND sell variant with MIT disclaimer - reverse",
       "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disclaimer-rev.html",
-      "referenceNumber": 357,
+      "referenceNumber": 449,
       "seeAlso": [
         "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/dynlist.c"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-SMC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-SMC",
+      "name": "Historical Permission Notice and Disclaimer - SMC variant",
+      "reference": "https://spdx.org/licenses/HPND-SMC.html",
+      "referenceNumber": 480,
+      "seeAlso": [
+        "https://docs.python.org/3/license.html#execution-tracing"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/HPND-UC.json",
       "isDeprecatedLicenseId": false,
@@ -4365,7 +4508,7 @@
       "licenseId": "HPND-UC",
       "name": "Historical Permission Notice and Disclaimer - University of California variant",
       "reference": "https://spdx.org/licenses/HPND-UC.html",
-      "referenceNumber": 210,
+      "referenceNumber": 699,
       "seeAlso": [
         "https://core.tcl-lang.org/tk/file?name=compat/unistd.h"
       ]
@@ -4377,7 +4520,7 @@
       "licenseId": "HPND-UC-export-US",
       "name": "Historical Permission Notice and Disclaimer - University of California, US export warning",
       "reference": "https://spdx.org/licenses/HPND-UC-export-US.html",
-      "referenceNumber": 143,
+      "referenceNumber": 530,
       "seeAlso": [
         "https://github.com/RTimothyEdwards/magic/blob/master/LICENSE"
       ]
@@ -4389,11 +4532,24 @@
       "licenseId": "HTMLTIDY",
       "name": "HTML Tidy License",
       "reference": "https://spdx.org/licenses/HTMLTIDY.html",
-      "referenceNumber": 478,
+      "referenceNumber": 192,
       "seeAlso": [
         "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/hyphen-bulgarian.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "hyphen-bulgarian",
+      "name": "hyphen-bulgarian License",
+      "reference": "https://spdx.org/licenses/hyphen-bulgarian.html",
+      "referenceNumber": 465,
+      "seeAlso": [
+        "https://ctan.math.illinois.edu/systems/texlive/tlnet/archive/hyphen-bulgarian.tar.xz",
+        "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/blob/959538769bfad6a73bdf34275d46520ec0f9cbb5/COPYING#L176-185"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/IBM-pibs.json",
       "isDeprecatedLicenseId": false,
@@ -4401,7 +4557,7 @@
       "licenseId": "IBM-pibs",
       "name": "IBM PowerPC Initialization and Boot Software",
       "reference": "https://spdx.org/licenses/IBM-pibs.html",
-      "referenceNumber": 242,
+      "referenceNumber": 61,
       "seeAlso": [
         "http://git.denx.de/?p=u-boot.git;a=blob;f=arch/powerpc/cpu/ppc4xx/miiphy.c;h=297155fdafa064b955e53e9832de93bfb0cfb85b;hb=9fab4bf4cc077c21e43941866f3f2c196f28670d"
       ]
@@ -4413,7 +4569,7 @@
       "licenseId": "ICU",
       "name": "ICU License",
       "reference": "https://spdx.org/licenses/ICU.html",
-      "referenceNumber": 289,
+      "referenceNumber": 269,
       "seeAlso": [
         "http://source.icu-project.org/repos/icu/icu/trunk/license.html"
       ]
@@ -4425,7 +4581,7 @@
       "licenseId": "IEC-Code-Components-EULA",
       "name": "IEC    Code Components End-user licence agreement",
       "reference": "https://spdx.org/licenses/IEC-Code-Components-EULA.html",
-      "referenceNumber": 399,
+      "referenceNumber": 196,
       "seeAlso": [
         "https://www.iec.ch/webstore/custserv/pdf/CC-EULA.pdf",
         "https://www.iec.ch/CCv1",
@@ -4440,9 +4596,11 @@
       "licenseId": "IJG",
       "name": "Independent JPEG Group License",
       "reference": "https://spdx.org/licenses/IJG.html",
-      "referenceNumber": 512,
+      "referenceNumber": 85,
       "seeAlso": [
-        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev=1.2"
+        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev=1.2",
+        "https://github.com/vstroebel/jpeg-encoder/blob/main/src/fdct.rs#L1-L72",
+        "https://github.com/libjpeg-turbo/libjpeg-turbo/blob/main/README.ijg#L117-L161"
       ]
     },
     {
@@ -4452,7 +4610,7 @@
       "licenseId": "IJG-short",
       "name": "Independent JPEG Group License - short",
       "reference": "https://spdx.org/licenses/IJG-short.html",
-      "referenceNumber": 694,
+      "referenceNumber": 644,
       "seeAlso": [
         "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/ljpg/"
       ]
@@ -4464,7 +4622,7 @@
       "licenseId": "ImageMagick",
       "name": "ImageMagick License",
       "reference": "https://spdx.org/licenses/ImageMagick.html",
-      "referenceNumber": 472,
+      "referenceNumber": 335,
       "seeAlso": [
         "http://www.imagemagick.org/script/license.php"
       ]
@@ -4477,7 +4635,7 @@
       "licenseId": "iMatix",
       "name": "iMatix Standard Function Library Agreement",
       "reference": "https://spdx.org/licenses/iMatix.html",
-      "referenceNumber": 482,
+      "referenceNumber": 469,
       "seeAlso": [
         "http://legacy.imatix.com/html/sfl/sfl4.htm#license"
       ]
@@ -4490,7 +4648,7 @@
       "licenseId": "Imlib2",
       "name": "Imlib2 License",
       "reference": "https://spdx.org/licenses/Imlib2.html",
-      "referenceNumber": 552,
+      "referenceNumber": 655,
       "seeAlso": [
         "http://trac.enlightenment.org/e/browser/trunk/imlib2/COPYING",
         "https://git.enlightenment.org/legacy/imlib2.git/tree/COPYING"
@@ -4503,7 +4661,7 @@
       "licenseId": "Info-ZIP",
       "name": "Info-ZIP License",
       "reference": "https://spdx.org/licenses/Info-ZIP.html",
-      "referenceNumber": 52,
+      "referenceNumber": 328,
       "seeAlso": [
         "http://www.info-zip.org/license.html"
       ]
@@ -4515,7 +4673,7 @@
       "licenseId": "Inner-Net-2.0",
       "name": "Inner Net License v2.0",
       "reference": "https://spdx.org/licenses/Inner-Net-2.0.html",
-      "referenceNumber": 328,
+      "referenceNumber": 293,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Inner_Net_License",
         "https://sourceware.org/git/?p=glibc.git;a=blob;f=LICENSES;h=530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=HEAD#l207"
@@ -4528,7 +4686,7 @@
       "licenseId": "InnoSetup",
       "name": "Inno Setup License",
       "reference": "https://spdx.org/licenses/InnoSetup.html",
-      "referenceNumber": 354,
+      "referenceNumber": 11,
       "seeAlso": [
         "https://github.com/jrsoftware/issrc/blob/HEAD/license.txt"
       ]
@@ -4541,7 +4699,7 @@
       "licenseId": "Intel",
       "name": "Intel Open Source License",
       "reference": "https://spdx.org/licenses/Intel.html",
-      "referenceNumber": 419,
+      "referenceNumber": 418,
       "seeAlso": [
         "https://opensource.org/licenses/Intel"
       ]
@@ -4553,7 +4711,7 @@
       "licenseId": "Intel-ACPI",
       "name": "Intel ACPI Software License Agreement",
       "reference": "https://spdx.org/licenses/Intel-ACPI.html",
-      "referenceNumber": 206,
+      "referenceNumber": 329,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Intel_ACPI_Software_License_Agreement"
       ]
@@ -4565,7 +4723,7 @@
       "licenseId": "Interbase-1.0",
       "name": "Interbase Public License v1.0",
       "reference": "https://spdx.org/licenses/Interbase-1.0.html",
-      "referenceNumber": 532,
+      "referenceNumber": 438,
       "seeAlso": [
         "https://web.archive.org/web/20060319014854/http://info.borland.com/devsupport/interbase/opensource/IPL.html"
       ]
@@ -4578,7 +4736,7 @@
       "licenseId": "IPA",
       "name": "IPA Font License",
       "reference": "https://spdx.org/licenses/IPA.html",
-      "referenceNumber": 186,
+      "referenceNumber": 508,
       "seeAlso": [
         "https://opensource.org/licenses/IPA"
       ]
@@ -4591,7 +4749,7 @@
       "licenseId": "IPL-1.0",
       "name": "IBM Public License v1.0",
       "reference": "https://spdx.org/licenses/IPL-1.0.html",
-      "referenceNumber": 591,
+      "referenceNumber": 338,
       "seeAlso": [
         "https://opensource.org/licenses/IPL-1.0"
       ]
@@ -4604,7 +4762,7 @@
       "licenseId": "ISC",
       "name": "ISC License",
       "reference": "https://spdx.org/licenses/ISC.html",
-      "referenceNumber": 58,
+      "referenceNumber": 481,
       "seeAlso": [
         "https://www.isc.org/licenses/",
         "https://www.isc.org/downloads/software-support-policy/isc-license/",
@@ -4618,13 +4776,26 @@
       "licenseId": "ISC-Veillard",
       "name": "ISC Veillard variant",
       "reference": "https://spdx.org/licenses/ISC-Veillard.html",
-      "referenceNumber": 317,
+      "referenceNumber": 406,
       "seeAlso": [
         "https://raw.githubusercontent.com/GNOME/libxml2/4c2e7c651f6c2f0d1a74f350cbda95f7df3e7017/hash.c",
         "https://github.com/GNOME/libxml2/blob/master/dict.c",
         "https://sourceforge.net/p/ctrio/git/ci/master/tree/README"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ISO-permission.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ISO-permission",
+      "name": "ISO permission notice",
+      "reference": "https://spdx.org/licenses/ISO-permission.html",
+      "referenceNumber": 302,
+      "seeAlso": [
+        "https://gitlab.com/agmartin/linuxdoc-tools/-/blob/master/iso-entities/COPYING?ref_type=heads",
+        "https://www.itu.int/ITU-T/formal-language/itu-t/t/t173/1997/ISOMHEG-sir.html"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/Jam.json",
       "isDeprecatedLicenseId": false,
@@ -4632,7 +4803,7 @@
       "licenseId": "Jam",
       "name": "Jam License",
       "reference": "https://spdx.org/licenses/Jam.html",
-      "referenceNumber": 475,
+      "referenceNumber": 109,
       "seeAlso": [
         "https://www.boost.org/doc/libs/1_35_0/doc/html/jam.html",
         "https://web.archive.org/web/20160330173339/https://swarm.workshop.perforce.com/files/guest/perforce_software/jam/src/README"
@@ -4645,7 +4816,7 @@
       "licenseId": "JasPer-2.0",
       "name": "JasPer License",
       "reference": "https://spdx.org/licenses/JasPer-2.0.html",
-      "referenceNumber": 103,
+      "referenceNumber": 665,
       "seeAlso": [
         "http://www.ece.uvic.ca/~mdadams/jasper/LICENSE"
       ]
@@ -4657,7 +4828,7 @@
       "licenseId": "jove",
       "name": "Jove License",
       "reference": "https://spdx.org/licenses/jove.html",
-      "referenceNumber": 642,
+      "referenceNumber": 238,
       "seeAlso": [
         "https://github.com/jonmacs/jove/blob/4_17/LICENSE"
       ]
@@ -4669,7 +4840,7 @@
       "licenseId": "JPL-image",
       "name": "JPL Image Use Policy",
       "reference": "https://spdx.org/licenses/JPL-image.html",
-      "referenceNumber": 321,
+      "referenceNumber": 31,
       "seeAlso": [
         "https://www.jpl.nasa.gov/jpl-image-use-policy"
       ]
@@ -4681,7 +4852,7 @@
       "licenseId": "JPNIC",
       "name": "Japan Network Information Center License",
       "reference": "https://spdx.org/licenses/JPNIC.html",
-      "referenceNumber": 655,
+      "referenceNumber": 578,
       "seeAlso": [
         "https://gitlab.isc.org/isc-projects/bind9/blob/master/COPYRIGHT#L366"
       ]
@@ -4694,7 +4865,7 @@
       "licenseId": "JSON",
       "name": "JSON License",
       "reference": "https://spdx.org/licenses/JSON.html",
-      "referenceNumber": 54,
+      "referenceNumber": 295,
       "seeAlso": [
         "http://www.json.org/license.html"
       ]
@@ -4706,7 +4877,7 @@
       "licenseId": "Kastrup",
       "name": "Kastrup License",
       "reference": "https://spdx.org/licenses/Kastrup.html",
-      "referenceNumber": 491,
+      "referenceNumber": 675,
       "seeAlso": [
         "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/kastrup/binhex.dtx"
       ]
@@ -4718,7 +4889,7 @@
       "licenseId": "Kazlib",
       "name": "Kazlib License",
       "reference": "https://spdx.org/licenses/Kazlib.html",
-      "referenceNumber": 312,
+      "referenceNumber": 185,
       "seeAlso": [
         "http://git.savannah.gnu.org/cgit/kazlib.git/tree/except.c?id=0062df360c2d17d57f6af19b0e444c51feb99036"
       ]
@@ -4730,7 +4901,7 @@
       "licenseId": "Knuth-CTAN",
       "name": "Knuth CTAN License",
       "reference": "https://spdx.org/licenses/Knuth-CTAN.html",
-      "referenceNumber": 332,
+      "referenceNumber": 369,
       "seeAlso": [
         "https://ctan.org/license/knuth"
       ]
@@ -4742,7 +4913,7 @@
       "licenseId": "LAL-1.2",
       "name": "Licence Art Libre 1.2",
       "reference": "https://spdx.org/licenses/LAL-1.2.html",
-      "referenceNumber": 134,
+      "referenceNumber": 247,
       "seeAlso": [
         "http://artlibre.org/licence/lal/licence-art-libre-12/"
       ]
@@ -4754,7 +4925,7 @@
       "licenseId": "LAL-1.3",
       "name": "Licence Art Libre 1.3",
       "reference": "https://spdx.org/licenses/LAL-1.3.html",
-      "referenceNumber": 521,
+      "referenceNumber": 471,
       "seeAlso": [
         "https://artlibre.org/"
       ]
@@ -4766,7 +4937,7 @@
       "licenseId": "Latex2e",
       "name": "Latex2e License",
       "reference": "https://spdx.org/licenses/Latex2e.html",
-      "referenceNumber": 43,
+      "referenceNumber": 225,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Latex2e"
       ]
@@ -4778,7 +4949,7 @@
       "licenseId": "Latex2e-translated-notice",
       "name": "Latex2e with translated notice permission",
       "reference": "https://spdx.org/licenses/Latex2e-translated-notice.html",
-      "referenceNumber": 523,
+      "referenceNumber": 57,
       "seeAlso": [
         "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.texi?id=a74c6b4ee49397cf330b333da1042bffa60ed14f#n74"
       ]
@@ -4790,7 +4961,7 @@
       "licenseId": "Leptonica",
       "name": "Leptonica License",
       "reference": "https://spdx.org/licenses/Leptonica.html",
-      "referenceNumber": 137,
+      "referenceNumber": 181,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Leptonica"
       ]
@@ -4802,7 +4973,7 @@
       "licenseId": "LGPL-2.0",
       "name": "GNU Library General Public License v2 only",
       "reference": "https://spdx.org/licenses/LGPL-2.0.html",
-      "referenceNumber": 676,
+      "referenceNumber": 353,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
       ]
@@ -4814,7 +4985,7 @@
       "licenseId": "LGPL-2.0+",
       "name": "GNU Library General Public License v2 or later",
       "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
-      "referenceNumber": 409,
+      "referenceNumber": 454,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
       ]
@@ -4826,7 +4997,7 @@
       "licenseId": "LGPL-2.0-only",
       "name": "GNU Library General Public License v2 only",
       "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
-      "referenceNumber": 329,
+      "referenceNumber": 306,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
       ]
@@ -4838,7 +5009,7 @@
       "licenseId": "LGPL-2.0-or-later",
       "name": "GNU Library General Public License v2 or later",
       "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
-      "referenceNumber": 75,
+      "referenceNumber": 279,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
       ]
@@ -4851,7 +5022,7 @@
       "licenseId": "LGPL-2.1",
       "name": "GNU Lesser General Public License v2.1 only",
       "reference": "https://spdx.org/licenses/LGPL-2.1.html",
-      "referenceNumber": 677,
+      "referenceNumber": 275,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
         "https://opensource.org/licenses/LGPL-2.1"
@@ -4865,7 +5036,7 @@
       "licenseId": "LGPL-2.1+",
       "name": "GNU Lesser General Public License v2.1 or later",
       "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
-      "referenceNumber": 448,
+      "referenceNumber": 162,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
         "https://opensource.org/licenses/LGPL-2.1"
@@ -4879,9 +5050,10 @@
       "licenseId": "LGPL-2.1-only",
       "name": "GNU Lesser General Public License v2.1 only",
       "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
-      "referenceNumber": 297,
+      "referenceNumber": 482,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html",
         "https://opensource.org/licenses/LGPL-2.1"
       ]
     },
@@ -4893,9 +5065,10 @@
       "licenseId": "LGPL-2.1-or-later",
       "name": "GNU Lesser General Public License v2.1 or later",
       "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
-      "referenceNumber": 187,
+      "referenceNumber": 334,
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html",
         "https://opensource.org/licenses/LGPL-2.1"
       ]
     },
@@ -4907,7 +5080,7 @@
       "licenseId": "LGPL-3.0",
       "name": "GNU Lesser General Public License v3.0 only",
       "reference": "https://spdx.org/licenses/LGPL-3.0.html",
-      "referenceNumber": 9,
+      "referenceNumber": 426,
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
@@ -4922,7 +5095,7 @@
       "licenseId": "LGPL-3.0+",
       "name": "GNU Lesser General Public License v3.0 or later",
       "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
-      "referenceNumber": 169,
+      "referenceNumber": 556,
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
@@ -4937,7 +5110,7 @@
       "licenseId": "LGPL-3.0-only",
       "name": "GNU Lesser General Public License v3.0 only",
       "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
-      "referenceNumber": 634,
+      "referenceNumber": 725,
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
@@ -4952,7 +5125,7 @@
       "licenseId": "LGPL-3.0-or-later",
       "name": "GNU Lesser General Public License v3.0 or later",
       "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
-      "referenceNumber": 502,
+      "referenceNumber": 563,
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
@@ -4966,7 +5139,7 @@
       "licenseId": "LGPLLR",
       "name": "Lesser General Public License For Linguistic Resources",
       "reference": "https://spdx.org/licenses/LGPLLR.html",
-      "referenceNumber": 123,
+      "referenceNumber": 34,
       "seeAlso": [
         "http://www-igm.univ-mlv.fr/~unitex/lgpllr.html"
       ]
@@ -4978,7 +5151,7 @@
       "licenseId": "Libpng",
       "name": "libpng License",
       "reference": "https://spdx.org/licenses/Libpng.html",
-      "referenceNumber": 62,
+      "referenceNumber": 280,
       "seeAlso": [
         "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
       ]
@@ -4990,7 +5163,7 @@
       "licenseId": "libpng-1.6.35",
       "name": "PNG Reference Library License v1 (for libpng 0.5 through 1.6.35)",
       "reference": "https://spdx.org/licenses/libpng-1.6.35.html",
-      "referenceNumber": 429,
+      "referenceNumber": 441,
       "seeAlso": [
         "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
       ]
@@ -5002,7 +5175,7 @@
       "licenseId": "libpng-2.0",
       "name": "PNG Reference Library version 2",
       "reference": "https://spdx.org/licenses/libpng-2.0.html",
-      "referenceNumber": 226,
+      "referenceNumber": 330,
       "seeAlso": [
         "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
       ]
@@ -5014,7 +5187,7 @@
       "licenseId": "libselinux-1.0",
       "name": "libselinux public domain notice",
       "reference": "https://spdx.org/licenses/libselinux-1.0.html",
-      "referenceNumber": 263,
+      "referenceNumber": 331,
       "seeAlso": [
         "https://github.com/SELinuxProject/selinux/blob/master/libselinux/LICENSE"
       ]
@@ -5026,7 +5199,7 @@
       "licenseId": "libtiff",
       "name": "libtiff License",
       "reference": "https://spdx.org/licenses/libtiff.html",
-      "referenceNumber": 35,
+      "referenceNumber": 213,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/libtiff"
       ]
@@ -5038,7 +5211,7 @@
       "licenseId": "libutil-David-Nugent",
       "name": "libutil David Nugent License",
       "reference": "https://spdx.org/licenses/libutil-David-Nugent.html",
-      "referenceNumber": 402,
+      "referenceNumber": 399,
       "seeAlso": [
         "http://web.mit.edu/freebsd/head/lib/libutil/login_ok.3",
         "https://cgit.freedesktop.org/libbsd/tree/man/setproctitle.3bsd"
@@ -5051,10 +5224,11 @@
       "licenseId": "LiLiQ-P-1.1",
       "name": "Licence Libre du Qu\u00e9bec \u2013 Permissive version 1.1",
       "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
-      "referenceNumber": 232,
+      "referenceNumber": 201,
       "seeAlso": [
         "https://forge.gouv.qc.ca/licence/fr/liliq-v1-1/",
-        "http://opensource.org/licenses/LiLiQ-P-1.1"
+        "http://opensource.org/licenses/LiLiQ-P-1.1",
+        "https://forge.gouv.qc.ca/licence/liliq-p/"
       ]
     },
     {
@@ -5064,10 +5238,11 @@
       "licenseId": "LiLiQ-R-1.1",
       "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9 version 1.1",
       "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
-      "referenceNumber": 229,
+      "referenceNumber": 632,
       "seeAlso": [
         "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licence-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-liliq-r-v1-1/",
-        "http://opensource.org/licenses/LiLiQ-R-1.1"
+        "http://opensource.org/licenses/LiLiQ-R-1.1",
+        "https://forge.gouv.qc.ca/licence/liliq-p"
       ]
     },
     {
@@ -5077,10 +5252,11 @@
       "licenseId": "LiLiQ-Rplus-1.1",
       "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9 forte version 1.1",
       "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
-      "referenceNumber": 238,
+      "referenceNumber": 510,
       "seeAlso": [
         "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licence-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-forte-liliq-r-v1-1/",
-        "http://opensource.org/licenses/LiLiQ-Rplus-1.1"
+        "http://opensource.org/licenses/LiLiQ-Rplus-1.1",
+        "https://forge.gouv.qc.ca/licence/liliq-r+/"
       ]
     },
     {
@@ -5090,7 +5266,7 @@
       "licenseId": "Linux-man-pages-1-para",
       "name": "Linux man-pages - 1 paragraph",
       "reference": "https://spdx.org/licenses/Linux-man-pages-1-para.html",
-      "referenceNumber": 78,
+      "referenceNumber": 341,
       "seeAlso": [
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/man2/getcpu.2#n4"
       ]
@@ -5102,7 +5278,7 @@
       "licenseId": "Linux-man-pages-copyleft",
       "name": "Linux man-pages Copyleft",
       "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft.html",
-      "referenceNumber": 640,
+      "referenceNumber": 362,
       "seeAlso": [
         "https://www.kernel.org/doc/man-pages/licenses.html"
       ]
@@ -5114,7 +5290,7 @@
       "licenseId": "Linux-man-pages-copyleft-2-para",
       "name": "Linux man-pages Copyleft - 2 paragraphs",
       "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-2-para.html",
-      "referenceNumber": 592,
+      "referenceNumber": 611,
       "seeAlso": [
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/man2/move_pages.2#n5",
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/man2/migrate_pages.2#n8"
@@ -5127,7 +5303,7 @@
       "licenseId": "Linux-man-pages-copyleft-var",
       "name": "Linux man-pages Copyleft Variant",
       "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-var.html",
-      "referenceNumber": 202,
+      "referenceNumber": 629,
       "seeAlso": [
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/man2/set_mempolicy.2#n5"
       ]
@@ -5139,7 +5315,7 @@
       "licenseId": "Linux-OpenIB",
       "name": "Linux Kernel Variant of OpenIB.org license",
       "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
-      "referenceNumber": 513,
+      "referenceNumber": 639,
       "seeAlso": [
         "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/infiniband/core/sa.h"
       ]
@@ -5151,7 +5327,7 @@
       "licenseId": "LOOP",
       "name": "Common Lisp LOOP License",
       "reference": "https://spdx.org/licenses/LOOP.html",
-      "referenceNumber": 237,
+      "referenceNumber": 498,
       "seeAlso": [
         "https://gitlab.com/embeddable-common-lisp/ecl/-/blob/develop/src/lsp/loop.lsp",
         "http://git.savannah.gnu.org/cgit/gcl.git/tree/gcl/lsp/gcl_loop.lsp?h=Version_2_6_13pre",
@@ -5168,7 +5344,7 @@
       "licenseId": "LPD-document",
       "name": "LPD Documentation License",
       "reference": "https://spdx.org/licenses/LPD-document.html",
-      "referenceNumber": 5,
+      "referenceNumber": 232,
       "seeAlso": [
         "https://github.com/Cyan4973/xxHash/blob/dev/doc/xxhash_spec.md",
         "https://www.ietf.org/rfc/rfc1952.txt"
@@ -5181,7 +5357,7 @@
       "licenseId": "LPL-1.0",
       "name": "Lucent Public License Version 1.0",
       "reference": "https://spdx.org/licenses/LPL-1.0.html",
-      "referenceNumber": 136,
+      "referenceNumber": 39,
       "seeAlso": [
         "https://opensource.org/licenses/LPL-1.0"
       ]
@@ -5194,7 +5370,7 @@
       "licenseId": "LPL-1.02",
       "name": "Lucent Public License v1.02",
       "reference": "https://spdx.org/licenses/LPL-1.02.html",
-      "referenceNumber": 656,
+      "referenceNumber": 532,
       "seeAlso": [
         "http://plan9.bell-labs.com/plan9/license.html",
         "https://opensource.org/licenses/LPL-1.02"
@@ -5207,7 +5383,7 @@
       "licenseId": "LPPL-1.0",
       "name": "LaTeX Project Public License v1.0",
       "reference": "https://spdx.org/licenses/LPPL-1.0.html",
-      "referenceNumber": 63,
+      "referenceNumber": 33,
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-0.txt"
       ]
@@ -5219,7 +5395,7 @@
       "licenseId": "LPPL-1.1",
       "name": "LaTeX Project Public License v1.1",
       "reference": "https://spdx.org/licenses/LPPL-1.1.html",
-      "referenceNumber": 542,
+      "referenceNumber": 367,
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-1.txt"
       ]
@@ -5232,7 +5408,7 @@
       "licenseId": "LPPL-1.2",
       "name": "LaTeX Project Public License v1.2",
       "reference": "https://spdx.org/licenses/LPPL-1.2.html",
-      "referenceNumber": 486,
+      "referenceNumber": 541,
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-2.txt"
       ]
@@ -5245,7 +5421,7 @@
       "licenseId": "LPPL-1.3a",
       "name": "LaTeX Project Public License v1.3a",
       "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
-      "referenceNumber": 280,
+      "referenceNumber": 470,
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-3a.txt"
       ]
@@ -5257,7 +5433,7 @@
       "licenseId": "LPPL-1.3c",
       "name": "LaTeX Project Public License v1.3c",
       "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
-      "referenceNumber": 33,
+      "referenceNumber": 679,
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-3c.txt",
         "https://opensource.org/licenses/LPPL-1.3c"
@@ -5270,7 +5446,7 @@
       "licenseId": "lsof",
       "name": "lsof License",
       "reference": "https://spdx.org/licenses/lsof.html",
-      "referenceNumber": 563,
+      "referenceNumber": 659,
       "seeAlso": [
         "https://github.com/lsof-org/lsof/blob/master/COPYING"
       ]
@@ -5282,7 +5458,7 @@
       "licenseId": "Lucida-Bitmap-Fonts",
       "name": "Lucida Bitmap Fonts License",
       "reference": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.html",
-      "referenceNumber": 661,
+      "referenceNumber": 540,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/font/bh-100dpi/-/blob/master/COPYING?ref_type=heads"
       ]
@@ -5294,7 +5470,7 @@
       "licenseId": "LZMA-SDK-9.11-to-9.20",
       "name": "LZMA SDK License (versions 9.11 to 9.20)",
       "reference": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.html",
-      "referenceNumber": 349,
+      "referenceNumber": 230,
       "seeAlso": [
         "https://www.7-zip.org/sdk.html",
         "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
@@ -5307,7 +5483,7 @@
       "licenseId": "LZMA-SDK-9.22",
       "name": "LZMA SDK License (versions 9.22 and beyond)",
       "reference": "https://spdx.org/licenses/LZMA-SDK-9.22.html",
-      "referenceNumber": 504,
+      "referenceNumber": 462,
       "seeAlso": [
         "https://www.7-zip.org/sdk.html",
         "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
@@ -5320,7 +5496,7 @@
       "licenseId": "Mackerras-3-Clause",
       "name": "Mackerras 3-Clause License",
       "reference": "https://spdx.org/licenses/Mackerras-3-Clause.html",
-      "referenceNumber": 539,
+      "referenceNumber": 9,
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/chap_ms.c#L6-L28"
       ]
@@ -5332,7 +5508,7 @@
       "licenseId": "Mackerras-3-Clause-acknowledgment",
       "name": "Mackerras 3-Clause - acknowledgment variant",
       "reference": "https://spdx.org/licenses/Mackerras-3-Clause-acknowledgment.html",
-      "referenceNumber": 433,
+      "referenceNumber": 392,
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/auth.c#L6-L28"
       ]
@@ -5344,7 +5520,7 @@
       "licenseId": "magaz",
       "name": "magaz License",
       "reference": "https://spdx.org/licenses/magaz.html",
-      "referenceNumber": 373,
+      "referenceNumber": 163,
       "seeAlso": [
         "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/magaz/magaz.tex",
         "https://mirrors.ctan.org/macros/latex/contrib/version/version.sty"
@@ -5357,7 +5533,7 @@
       "licenseId": "mailprio",
       "name": "mailprio License",
       "reference": "https://spdx.org/licenses/mailprio.html",
-      "referenceNumber": 381,
+      "referenceNumber": 112,
       "seeAlso": [
         "https://fossies.org/linux/sendmail/contrib/mailprio"
       ]
@@ -5369,7 +5545,7 @@
       "licenseId": "MakeIndex",
       "name": "MakeIndex License",
       "reference": "https://spdx.org/licenses/MakeIndex.html",
-      "referenceNumber": 165,
+      "referenceNumber": 6,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MakeIndex"
       ]
@@ -5381,7 +5557,7 @@
       "licenseId": "man2html",
       "name": "man2html License",
       "reference": "https://spdx.org/licenses/man2html.html",
-      "referenceNumber": 120,
+      "referenceNumber": 726,
       "seeAlso": [
         "http://primates.ximian.com/~flucifredi/man/man-1.6g.tar.gz",
         "https://github.com/hamano/man2html/blob/master/man2html.c",
@@ -5395,7 +5571,7 @@
       "licenseId": "Martin-Birgmeier",
       "name": "Martin Birgmeier License",
       "reference": "https://spdx.org/licenses/Martin-Birgmeier.html",
-      "referenceNumber": 361,
+      "referenceNumber": 453,
       "seeAlso": [
         "https://github.com/Perl/perl5/blob/blead/util.c#L6136"
       ]
@@ -5407,7 +5583,7 @@
       "licenseId": "McPhee-slideshow",
       "name": "McPhee Slideshow License",
       "reference": "https://spdx.org/licenses/McPhee-slideshow.html",
-      "referenceNumber": 489,
+      "referenceNumber": 48,
       "seeAlso": [
         "https://mirror.las.iastate.edu/tex-archive/graphics/metapost/contrib/macros/slideshow/slideshow.mp"
       ]
@@ -5419,7 +5595,7 @@
       "licenseId": "metamail",
       "name": "metamail License",
       "reference": "https://spdx.org/licenses/metamail.html",
-      "referenceNumber": 455,
+      "referenceNumber": 139,
       "seeAlso": [
         "https://github.com/Dual-Life/mime-base64/blob/master/Base64.xs#L12"
       ]
@@ -5431,7 +5607,7 @@
       "licenseId": "Minpack",
       "name": "Minpack License",
       "reference": "https://spdx.org/licenses/Minpack.html",
-      "referenceNumber": 28,
+      "referenceNumber": 360,
       "seeAlso": [
         "http://www.netlib.org/minpack/disclaimer",
         "https://gitlab.com/libeigen/eigen/-/blob/master/COPYING.MINPACK"
@@ -5444,7 +5620,7 @@
       "licenseId": "MIPS",
       "name": "MIPS License",
       "reference": "https://spdx.org/licenses/MIPS.html",
-      "referenceNumber": 351,
+      "referenceNumber": 77,
       "seeAlso": [
         "https://sourceware.org/cgit/binutils-gdb/tree/include/coff/sym.h#n11"
       ]
@@ -5456,7 +5632,7 @@
       "licenseId": "MirOS",
       "name": "The MirOS Licence",
       "reference": "https://spdx.org/licenses/MirOS.html",
-      "referenceNumber": 692,
+      "referenceNumber": 8,
       "seeAlso": [
         "https://opensource.org/licenses/MirOS"
       ]
@@ -5469,7 +5645,7 @@
       "licenseId": "MIT",
       "name": "MIT License",
       "reference": "https://spdx.org/licenses/MIT.html",
-      "referenceNumber": 515,
+      "referenceNumber": 114,
       "seeAlso": [
         "https://opensource.org/license/mit/",
         "http://opensource.org/licenses/MIT"
@@ -5482,7 +5658,7 @@
       "licenseId": "MIT-0",
       "name": "MIT No Attribution",
       "reference": "https://spdx.org/licenses/MIT-0.html",
-      "referenceNumber": 173,
+      "referenceNumber": 264,
       "seeAlso": [
         "https://github.com/aws/mit-0",
         "https://romanrm.net/mit-zero",
@@ -5496,7 +5672,7 @@
       "licenseId": "MIT-advertising",
       "name": "Enlightenment License (e16)",
       "reference": "https://spdx.org/licenses/MIT-advertising.html",
-      "referenceNumber": 440,
+      "referenceNumber": 402,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
       ]
@@ -5508,7 +5684,7 @@
       "licenseId": "MIT-Click",
       "name": "MIT Click License",
       "reference": "https://spdx.org/licenses/MIT-Click.html",
-      "referenceNumber": 438,
+      "referenceNumber": 444,
       "seeAlso": [
         "https://github.com/kohler/t1utils/blob/master/LICENSE"
       ]
@@ -5520,7 +5696,7 @@
       "licenseId": "MIT-CMU",
       "name": "CMU License",
       "reference": "https://spdx.org/licenses/MIT-CMU.html",
-      "referenceNumber": 287,
+      "referenceNumber": 359,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT#CMU_Style",
         "https://github.com/python-pillow/Pillow/blob/fffb426092c8db24a5f4b6df243a8a3c01fb63cd/LICENSE"
@@ -5533,7 +5709,7 @@
       "licenseId": "MIT-enna",
       "name": "enna License",
       "reference": "https://spdx.org/licenses/MIT-enna.html",
-      "referenceNumber": 580,
+      "referenceNumber": 609,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT#enna"
       ]
@@ -5545,7 +5721,7 @@
       "licenseId": "MIT-feh",
       "name": "feh License",
       "reference": "https://spdx.org/licenses/MIT-feh.html",
-      "referenceNumber": 408,
+      "referenceNumber": 724,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT#feh"
       ]
@@ -5557,7 +5733,7 @@
       "licenseId": "MIT-Festival",
       "name": "MIT Festival Variant",
       "reference": "https://spdx.org/licenses/MIT-Festival.html",
-      "referenceNumber": 18,
+      "referenceNumber": 106,
       "seeAlso": [
         "https://github.com/festvox/flite/blob/master/COPYING",
         "https://github.com/festvox/speech_tools/blob/master/COPYING"
@@ -5570,7 +5746,7 @@
       "licenseId": "MIT-Khronos-old",
       "name": "MIT Khronos - old variant",
       "reference": "https://spdx.org/licenses/MIT-Khronos-old.html",
-      "referenceNumber": 508,
+      "referenceNumber": 597,
       "seeAlso": [
         "https://github.com/KhronosGroup/SPIRV-Cross/blob/main/LICENSES/LicenseRef-KhronosFreeUse.txt"
       ]
@@ -5582,7 +5758,7 @@
       "licenseId": "MIT-Modern-Variant",
       "name": "MIT License Modern Variant",
       "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
-      "referenceNumber": 304,
+      "referenceNumber": 227,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:MIT#Modern_Variants",
         "https://ptolemy.berkeley.edu/copyright.htm",
@@ -5596,13 +5772,25 @@
       "licenseId": "MIT-open-group",
       "name": "MIT Open Group variant",
       "reference": "https://spdx.org/licenses/MIT-open-group.html",
-      "referenceNumber": 404,
+      "referenceNumber": 555,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/COPYING",
         "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/COPYING",
         "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COPYING"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/MIT-STK.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "MIT-STK",
+      "name": "MIT-STK License",
+      "reference": "https://spdx.org/licenses/MIT-STK.html",
+      "referenceNumber": 296,
+      "seeAlso": [
+        "https://github.com/thestk/stk/blob/6aacd357d76250bb7da2b1ddf675651828784bbc/LICENSE"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/MIT-testregex.json",
       "isDeprecatedLicenseId": false,
@@ -5610,7 +5798,7 @@
       "licenseId": "MIT-testregex",
       "name": "MIT testregex Variant",
       "reference": "https://spdx.org/licenses/MIT-testregex.html",
-      "referenceNumber": 496,
+      "referenceNumber": 651,
       "seeAlso": [
         "https://github.com/dotnet/runtime/blob/55e1ac7c07df62c4108d4acedf78f77574470ce5/src/libraries/System.Text.RegularExpressions/tests/FunctionalTests/AttRegexTests.cs#L12-L28"
       ]
@@ -5622,7 +5810,7 @@
       "licenseId": "MIT-Wu",
       "name": "MIT Tom Wu Variant",
       "reference": "https://spdx.org/licenses/MIT-Wu.html",
-      "referenceNumber": 355,
+      "referenceNumber": 287,
       "seeAlso": [
         "https://github.com/chromium/octane/blob/master/crypto.js"
       ]
@@ -5634,7 +5822,7 @@
       "licenseId": "MITNFA",
       "name": "MIT +no-false-attribs license",
       "reference": "https://spdx.org/licenses/MITNFA.html",
-      "referenceNumber": 473,
+      "referenceNumber": 442,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MITNFA"
       ]
@@ -5646,11 +5834,24 @@
       "licenseId": "MMIXware",
       "name": "MMIXware License",
       "reference": "https://spdx.org/licenses/MMIXware.html",
-      "referenceNumber": 663,
+      "referenceNumber": 336,
       "seeAlso": [
         "https://gitlab.lrz.de/mmix/mmixware/-/blob/master/boilerplate.w"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/MMPL-1.0.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "MMPL-1.0.1",
+      "name": "Minecraft Mod Public License v1.0.1",
+      "reference": "https://spdx.org/licenses/MMPL-1.0.1.html",
+      "referenceNumber": 388,
+      "seeAlso": [
+        "https://github.com/BuildCraft/BuildCraft/blob/623d323b1868712f29f4a8b0979a02e8d1835131/LICENSE",
+        "https://mod-buildcraft.com/MMPL-1.0.txt"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
       "isDeprecatedLicenseId": false,
@@ -5658,7 +5859,7 @@
       "licenseId": "Motosoto",
       "name": "Motosoto License",
       "reference": "https://spdx.org/licenses/Motosoto.html",
-      "referenceNumber": 507,
+      "referenceNumber": 154,
       "seeAlso": [
         "https://opensource.org/licenses/Motosoto"
       ]
@@ -5670,7 +5871,7 @@
       "licenseId": "MPEG-SSG",
       "name": "MPEG Software Simulation",
       "reference": "https://spdx.org/licenses/MPEG-SSG.html",
-      "referenceNumber": 303,
+      "referenceNumber": 582,
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/converter/ppm/ppmtompeg/jrevdct.c#l1189"
       ]
@@ -5682,7 +5883,7 @@
       "licenseId": "mpi-permissive",
       "name": "mpi Permissive License",
       "reference": "https://spdx.org/licenses/mpi-permissive.html",
-      "referenceNumber": 213,
+      "referenceNumber": 80,
       "seeAlso": [
         "https://sources.debian.org/src/openmpi/4.1.0-10/ompi/debuggers/msgq_interface.h/?hl=19#L19"
       ]
@@ -5694,7 +5895,7 @@
       "licenseId": "mpich2",
       "name": "mpich2 License",
       "reference": "https://spdx.org/licenses/mpich2.html",
-      "referenceNumber": 102,
+      "referenceNumber": 104,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT"
       ]
@@ -5706,7 +5907,7 @@
       "licenseId": "MPL-1.0",
       "name": "Mozilla Public License 1.0",
       "reference": "https://spdx.org/licenses/MPL-1.0.html",
-      "referenceNumber": 665,
+      "referenceNumber": 427,
       "seeAlso": [
         "http://www.mozilla.org/MPL/MPL-1.0.html",
         "https://opensource.org/licenses/MPL-1.0"
@@ -5720,7 +5921,7 @@
       "licenseId": "MPL-1.1",
       "name": "Mozilla Public License 1.1",
       "reference": "https://spdx.org/licenses/MPL-1.1.html",
-      "referenceNumber": 679,
+      "referenceNumber": 479,
       "seeAlso": [
         "http://www.mozilla.org/MPL/MPL-1.1.html",
         "https://opensource.org/licenses/MPL-1.1"
@@ -5734,7 +5935,7 @@
       "licenseId": "MPL-2.0",
       "name": "Mozilla Public License 2.0",
       "reference": "https://spdx.org/licenses/MPL-2.0.html",
-      "referenceNumber": 599,
+      "referenceNumber": 420,
       "seeAlso": [
         "https://www.mozilla.org/MPL/2.0/",
         "https://opensource.org/licenses/MPL-2.0"
@@ -5747,7 +5948,7 @@
       "licenseId": "MPL-2.0-no-copyleft-exception",
       "name": "Mozilla Public License 2.0 (no copyleft exception)",
       "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-exception.html",
-      "referenceNumber": 174,
+      "referenceNumber": 521,
       "seeAlso": [
         "https://www.mozilla.org/MPL/2.0/",
         "https://opensource.org/licenses/MPL-2.0"
@@ -5760,7 +5961,7 @@
       "licenseId": "mplus",
       "name": "mplus Font License",
       "reference": "https://spdx.org/licenses/mplus.html",
-      "referenceNumber": 17,
+      "referenceNumber": 256,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:Mplus?rd=Licensing/mplus"
       ]
@@ -5772,7 +5973,7 @@
       "licenseId": "MS-LPL",
       "name": "Microsoft Limited Public License",
       "reference": "https://spdx.org/licenses/MS-LPL.html",
-      "referenceNumber": 674,
+      "referenceNumber": 187,
       "seeAlso": [
         "https://www.openhub.net/licenses/mslpl",
         "https://github.com/gabegundy/atlserver/blob/master/License.txt",
@@ -5787,7 +5988,7 @@
       "licenseId": "MS-PL",
       "name": "Microsoft Public License",
       "reference": "https://spdx.org/licenses/MS-PL.html",
-      "referenceNumber": 698,
+      "referenceNumber": 66,
       "seeAlso": [
         "http://www.microsoft.com/opensource/licenses.mspx",
         "https://opensource.org/licenses/MS-PL"
@@ -5801,7 +6002,7 @@
       "licenseId": "MS-RL",
       "name": "Microsoft Reciprocal License",
       "reference": "https://spdx.org/licenses/MS-RL.html",
-      "referenceNumber": 276,
+      "referenceNumber": 17,
       "seeAlso": [
         "http://www.microsoft.com/opensource/licenses.mspx",
         "https://opensource.org/licenses/MS-RL"
@@ -5814,7 +6015,7 @@
       "licenseId": "MTLL",
       "name": "Matrix Template Library License",
       "reference": "https://spdx.org/licenses/MTLL.html",
-      "referenceNumber": 588,
+      "referenceNumber": 374,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Matrix_Template_Library_License"
       ]
@@ -5826,7 +6027,7 @@
       "licenseId": "MulanPSL-1.0",
       "name": "Mulan Permissive Software License, Version 1",
       "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
-      "referenceNumber": 320,
+      "referenceNumber": 277,
       "seeAlso": [
         "https://license.coscl.org.cn/MulanPSL/",
         "https://github.com/yuwenlong/longphp/blob/25dfb70cc2a466dc4bb55ba30901cbce08d164b5/LICENSE"
@@ -5839,7 +6040,7 @@
       "licenseId": "MulanPSL-2.0",
       "name": "Mulan Permissive Software License, Version 2",
       "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
-      "referenceNumber": 182,
+      "referenceNumber": 708,
       "seeAlso": [
         "https://license.coscl.org.cn/MulanPSL2"
       ]
@@ -5851,7 +6052,7 @@
       "licenseId": "Multics",
       "name": "Multics License",
       "reference": "https://spdx.org/licenses/Multics.html",
-      "referenceNumber": 60,
+      "referenceNumber": 547,
       "seeAlso": [
         "https://opensource.org/licenses/Multics"
       ]
@@ -5863,7 +6064,7 @@
       "licenseId": "Mup",
       "name": "Mup License",
       "reference": "https://spdx.org/licenses/Mup.html",
-      "referenceNumber": 288,
+      "referenceNumber": 723,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Mup"
       ]
@@ -5875,7 +6076,7 @@
       "licenseId": "NAIST-2003",
       "name": "Nara Institute of Science and Technology License (2003)",
       "reference": "https://spdx.org/licenses/NAIST-2003.html",
-      "referenceNumber": 462,
+      "referenceNumber": 696,
       "seeAlso": [
         "https://enterprise.dejacode.com/licenses/public/naist-2003/#license-text",
         "https://github.com/nodejs/node/blob/4a19cc8947b1bba2b2d27816ec3d0edf9b28e503/LICENSE#L343"
@@ -5889,7 +6090,7 @@
       "licenseId": "NASA-1.3",
       "name": "NASA Open Source Agreement 1.3",
       "reference": "https://spdx.org/licenses/NASA-1.3.html",
-      "referenceNumber": 432,
+      "referenceNumber": 721,
       "seeAlso": [
         "http://ti.arc.nasa.gov/opensource/nosa/",
         "https://opensource.org/licenses/NASA-1.3"
@@ -5902,7 +6103,7 @@
       "licenseId": "Naumen",
       "name": "Naumen Public License",
       "reference": "https://spdx.org/licenses/Naumen.html",
-      "referenceNumber": 307,
+      "referenceNumber": 657,
       "seeAlso": [
         "https://opensource.org/licenses/Naumen"
       ]
@@ -5914,7 +6115,7 @@
       "licenseId": "NBPL-1.0",
       "name": "Net Boolean Public License v1",
       "reference": "https://spdx.org/licenses/NBPL-1.0.html",
-      "referenceNumber": 460,
+      "referenceNumber": 310,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=37b4b3f6cc4bf34e1d3dec61e69914b9819d8894"
       ]
@@ -5926,7 +6127,7 @@
       "licenseId": "NCBI-PD",
       "name": "NCBI Public Domain Notice",
       "reference": "https://spdx.org/licenses/NCBI-PD.html",
-      "referenceNumber": 696,
+      "referenceNumber": 550,
       "seeAlso": [
         "https://github.com/ncbi/sra-tools/blob/e8e5b6af4edc460156ad9ce5902d0779cffbf685/LICENSE",
         "https://github.com/ncbi/datasets/blob/0ea4cd16b61e5b799d9cc55aecfa016d6c9bd2bf/LICENSE.md",
@@ -5942,7 +6143,7 @@
       "licenseId": "NCGL-UK-2.0",
       "name": "Non-Commercial Government Licence",
       "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
-      "referenceNumber": 392,
+      "referenceNumber": 391,
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/non-commercial-government-licence/version/2/"
       ]
@@ -5954,7 +6155,7 @@
       "licenseId": "NCL",
       "name": "NCL Source Code License",
       "reference": "https://spdx.org/licenses/NCL.html",
-      "referenceNumber": 154,
+      "referenceNumber": 514,
       "seeAlso": [
         "https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/src/modules/module-filter-chain/pffft.c?ref_type=heads#L1-52"
       ]
@@ -5967,7 +6168,7 @@
       "licenseId": "NCSA",
       "name": "University of Illinois/NCSA Open Source License",
       "reference": "https://spdx.org/licenses/NCSA.html",
-      "referenceNumber": 148,
+      "referenceNumber": 83,
       "seeAlso": [
         "http://otm.illinois.edu/uiuc_openSource",
         "https://opensource.org/licenses/NCSA"
@@ -5980,7 +6181,7 @@
       "licenseId": "Net-SNMP",
       "name": "Net-SNMP License",
       "reference": "https://spdx.org/licenses/Net-SNMP.html",
-      "referenceNumber": 638,
+      "referenceNumber": 78,
       "seeAlso": [
         "http://net-snmp.sourceforge.net/about/license.html"
       ]
@@ -5992,7 +6193,7 @@
       "licenseId": "NetCDF",
       "name": "NetCDF license",
       "reference": "https://spdx.org/licenses/NetCDF.html",
-      "referenceNumber": 626,
+      "referenceNumber": 682,
       "seeAlso": [
         "http://www.unidata.ucar.edu/software/netcdf/copyright.html"
       ]
@@ -6004,7 +6205,7 @@
       "licenseId": "Newsletr",
       "name": "Newsletr License",
       "reference": "https://spdx.org/licenses/Newsletr.html",
-      "referenceNumber": 607,
+      "referenceNumber": 467,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Newsletr"
       ]
@@ -6016,7 +6217,7 @@
       "licenseId": "NGPL",
       "name": "Nethack General Public License",
       "reference": "https://spdx.org/licenses/NGPL.html",
-      "referenceNumber": 64,
+      "referenceNumber": 421,
       "seeAlso": [
         "https://opensource.org/licenses/NGPL"
       ]
@@ -6028,7 +6229,7 @@
       "licenseId": "ngrep",
       "name": "ngrep License",
       "reference": "https://spdx.org/licenses/ngrep.html",
-      "referenceNumber": 16,
+      "referenceNumber": 169,
       "seeAlso": [
         "https://github.com/jpr5/ngrep/blob/master/LICENSE"
       ]
@@ -6040,7 +6241,7 @@
       "licenseId": "NICTA-1.0",
       "name": "NICTA Public Software License, Version 1.0",
       "reference": "https://spdx.org/licenses/NICTA-1.0.html",
-      "referenceNumber": 406,
+      "referenceNumber": 394,
       "seeAlso": [
         "https://opensource.apple.com/source/mDNSResponder/mDNSResponder-320.10/mDNSPosix/nss_ReadMe.txt"
       ]
@@ -6052,7 +6253,7 @@
       "licenseId": "NIST-PD",
       "name": "NIST Public Domain Notice",
       "reference": "https://spdx.org/licenses/NIST-PD.html",
-      "referenceNumber": 98,
+      "referenceNumber": 446,
       "seeAlso": [
         "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfeceb2db8cba05b7c2e0cd3/LICENSE.txt",
         "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c98348188a65a135d98/README.md"
@@ -6065,12 +6266,24 @@
       "licenseId": "NIST-PD-fallback",
       "name": "NIST Public Domain Notice with license fallback",
       "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
-      "referenceNumber": 616,
+      "referenceNumber": 200,
       "seeAlso": [
         "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897d9a7d2656b42abe3/LICENSE",
         "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c5986071cf6568cc34/LICENSE.rst"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD-TNT.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "NIST-PD-TNT",
+      "name": "NIST    Public Domain Notice TNT variant",
+      "reference": "https://spdx.org/licenses/NIST-PD-TNT.html",
+      "referenceNumber": 105,
+      "seeAlso": [
+        "https://math.nist.gov/tnt/download.html"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/NIST-Software.json",
       "isDeprecatedLicenseId": false,
@@ -6078,7 +6291,7 @@
       "licenseId": "NIST-Software",
       "name": "NIST Software License",
       "reference": "https://spdx.org/licenses/NIST-Software.html",
-      "referenceNumber": 447,
+      "referenceNumber": 18,
       "seeAlso": [
         "https://github.com/open-quantum-safe/liboqs/blob/40b01fdbb270f8614fde30e65d30e9da18c02393/src/common/rand/rand_nist.c#L1-L15"
       ]
@@ -6090,7 +6303,7 @@
       "licenseId": "NLOD-1.0",
       "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
       "reference": "https://spdx.org/licenses/NLOD-1.0.html",
-      "referenceNumber": 249,
+      "referenceNumber": 667,
       "seeAlso": [
         "http://data.norge.no/nlod/en/1.0"
       ]
@@ -6102,7 +6315,7 @@
       "licenseId": "NLOD-2.0",
       "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
       "reference": "https://spdx.org/licenses/NLOD-2.0.html",
-      "referenceNumber": 687,
+      "referenceNumber": 368,
       "seeAlso": [
         "http://data.norge.no/nlod/en/2.0"
       ]
@@ -6114,7 +6327,7 @@
       "licenseId": "NLPL",
       "name": "No Limit Public License",
       "reference": "https://spdx.org/licenses/NLPL.html",
-      "referenceNumber": 161,
+      "referenceNumber": 447,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/NLPL"
       ]
@@ -6127,7 +6340,7 @@
       "licenseId": "Nokia",
       "name": "Nokia Open Source License",
       "reference": "https://spdx.org/licenses/Nokia.html",
-      "referenceNumber": 464,
+      "referenceNumber": 45,
       "seeAlso": [
         "https://opensource.org/licenses/nokia"
       ]
@@ -6140,7 +6353,7 @@
       "licenseId": "NOSL",
       "name": "Netizen Open Source License",
       "reference": "https://spdx.org/licenses/NOSL.html",
-      "referenceNumber": 471,
+      "referenceNumber": 257,
       "seeAlso": [
         "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
       ]
@@ -6152,7 +6365,7 @@
       "licenseId": "Noweb",
       "name": "Noweb License",
       "reference": "https://spdx.org/licenses/Noweb.html",
-      "referenceNumber": 77,
+      "referenceNumber": 3,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Noweb"
       ]
@@ -6165,7 +6378,7 @@
       "licenseId": "NPL-1.0",
       "name": "Netscape Public License v1.0",
       "reference": "https://spdx.org/licenses/NPL-1.0.html",
-      "referenceNumber": 372,
+      "referenceNumber": 115,
       "seeAlso": [
         "http://www.mozilla.org/MPL/NPL/1.0/"
       ]
@@ -6178,7 +6391,7 @@
       "licenseId": "NPL-1.1",
       "name": "Netscape Public License v1.1",
       "reference": "https://spdx.org/licenses/NPL-1.1.html",
-      "referenceNumber": 518,
+      "referenceNumber": 636,
       "seeAlso": [
         "http://www.mozilla.org/MPL/NPL/1.1/"
       ]
@@ -6190,7 +6403,7 @@
       "licenseId": "NPOSL-3.0",
       "name": "Non-Profit Open Software License 3.0",
       "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
-      "referenceNumber": 195,
+      "referenceNumber": 303,
       "seeAlso": [
         "https://opensource.org/licenses/NOSL3.0"
       ]
@@ -6202,7 +6415,7 @@
       "licenseId": "NRL",
       "name": "NRL License",
       "reference": "https://spdx.org/licenses/NRL.html",
-      "referenceNumber": 146,
+      "referenceNumber": 10,
       "seeAlso": [
         "http://web.mit.edu/network/isakmp/nrllicense.html"
       ]
@@ -6214,7 +6427,7 @@
       "licenseId": "NTIA-PD",
       "name": "NTIA Public Domain Notice",
       "reference": "https://spdx.org/licenses/NTIA-PD.html",
-      "referenceNumber": 426,
+      "referenceNumber": 44,
       "seeAlso": [
         "https://raw.githubusercontent.com/NTIA/itm/refs/heads/master/LICENSE.md",
         "https://raw.githubusercontent.com/NTIA/scos-sensor/refs/heads/master/LICENSE.md"
@@ -6227,7 +6440,7 @@
       "licenseId": "NTP",
       "name": "NTP License",
       "reference": "https://spdx.org/licenses/NTP.html",
-      "referenceNumber": 621,
+      "referenceNumber": 241,
       "seeAlso": [
         "https://opensource.org/licenses/NTP"
       ]
@@ -6239,7 +6452,7 @@
       "licenseId": "NTP-0",
       "name": "NTP No Attribution",
       "reference": "https://spdx.org/licenses/NTP-0.html",
-      "referenceNumber": 566,
+      "referenceNumber": 393,
       "seeAlso": [
         "https://github.com/tytso/e2fsprogs/blob/master/lib/et/et_name.c"
       ]
@@ -6252,7 +6465,7 @@
       "licenseId": "Nunit",
       "name": "Nunit License",
       "reference": "https://spdx.org/licenses/Nunit.html",
-      "referenceNumber": 203,
+      "referenceNumber": 698,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Nunit"
       ]
@@ -6264,7 +6477,7 @@
       "licenseId": "O-UDA-1.0",
       "name": "Open Use of Data Agreement v1.0",
       "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
-      "referenceNumber": 485,
+      "referenceNumber": 602,
       "seeAlso": [
         "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1.0/O-UDA-1.0.md",
         "https://cdla.dev/open-use-of-data-agreement-v1-0/"
@@ -6277,7 +6490,7 @@
       "licenseId": "OAR",
       "name": "OAR License",
       "reference": "https://spdx.org/licenses/OAR.html",
-      "referenceNumber": 251,
+      "referenceNumber": 79,
       "seeAlso": [
         "https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/libc/string/strsignal.c;hb=HEAD#l35"
       ]
@@ -6289,7 +6502,7 @@
       "licenseId": "OCCT-PL",
       "name": "Open CASCADE Technology Public License",
       "reference": "https://spdx.org/licenses/OCCT-PL.html",
-      "referenceNumber": 371,
+      "referenceNumber": 437,
       "seeAlso": [
         "http://www.opencascade.com/content/occt-public-license"
       ]
@@ -6301,7 +6514,7 @@
       "licenseId": "OCLC-2.0",
       "name": "OCLC Research Public License 2.0",
       "reference": "https://spdx.org/licenses/OCLC-2.0.html",
-      "referenceNumber": 274,
+      "referenceNumber": 55,
       "seeAlso": [
         "http://www.oclc.org/research/activities/software/license/v2final.htm",
         "https://opensource.org/licenses/OCLC-2.0"
@@ -6315,7 +6528,7 @@
       "licenseId": "ODbL-1.0",
       "name": "Open Data Commons Open Database License v1.0",
       "reference": "https://spdx.org/licenses/ODbL-1.0.html",
-      "referenceNumber": 397,
+      "referenceNumber": 627,
       "seeAlso": [
         "http://www.opendatacommons.org/licenses/odbl/1.0/",
         "https://opendatacommons.org/licenses/odbl/1-0/"
@@ -6328,7 +6541,7 @@
       "licenseId": "ODC-By-1.0",
       "name": "Open Data Commons Attribution License v1.0",
       "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
-      "referenceNumber": 46,
+      "referenceNumber": 485,
       "seeAlso": [
         "https://opendatacommons.org/licenses/by/1.0/"
       ]
@@ -6340,7 +6553,7 @@
       "licenseId": "OFFIS",
       "name": "OFFIS License",
       "reference": "https://spdx.org/licenses/OFFIS.html",
-      "referenceNumber": 368,
+      "referenceNumber": 263,
       "seeAlso": [
         "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/dicom/README"
       ]
@@ -6353,7 +6566,7 @@
       "licenseId": "OFL-1.0",
       "name": "SIL Open Font License 1.0",
       "reference": "https://spdx.org/licenses/OFL-1.0.html",
-      "referenceNumber": 589,
+      "referenceNumber": 71,
       "seeAlso": [
         "http://scripts.sil.org/cms/scripts/page.php?item_id=OFL10_web"
       ]
@@ -6365,7 +6578,7 @@
       "licenseId": "OFL-1.0-no-RFN",
       "name": "SIL Open Font License 1.0 with no Reserved Font Name",
       "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
-      "referenceNumber": 653,
+      "referenceNumber": 113,
       "seeAlso": [
         "http://scripts.sil.org/cms/scripts/page.php?item_id=OFL10_web"
       ]
@@ -6377,7 +6590,7 @@
       "licenseId": "OFL-1.0-RFN",
       "name": "SIL Open Font License 1.0 with Reserved Font Name",
       "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
-      "referenceNumber": 201,
+      "referenceNumber": 419,
       "seeAlso": [
         "http://scripts.sil.org/cms/scripts/page.php?item_id=OFL10_web"
       ]
@@ -6390,7 +6603,7 @@
       "licenseId": "OFL-1.1",
       "name": "SIL Open Font License 1.1",
       "reference": "https://spdx.org/licenses/OFL-1.1.html",
-      "referenceNumber": 608,
+      "referenceNumber": 474,
       "seeAlso": [
         "http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web",
         "https://opensource.org/licenses/OFL-1.1"
@@ -6403,7 +6616,7 @@
       "licenseId": "OFL-1.1-no-RFN",
       "name": "SIL Open Font License 1.1 with no Reserved Font Name",
       "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
-      "referenceNumber": 204,
+      "referenceNumber": 126,
       "seeAlso": [
         "http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web",
         "https://opensource.org/licenses/OFL-1.1"
@@ -6416,7 +6629,7 @@
       "licenseId": "OFL-1.1-RFN",
       "name": "SIL Open Font License 1.1 with Reserved Font Name",
       "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
-      "referenceNumber": 82,
+      "referenceNumber": 324,
       "seeAlso": [
         "http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web",
         "https://opensource.org/licenses/OFL-1.1"
@@ -6429,7 +6642,7 @@
       "licenseId": "OGC-1.0",
       "name": "OGC Software License, Version 1.0",
       "reference": "https://spdx.org/licenses/OGC-1.0.html",
-      "referenceNumber": 612,
+      "referenceNumber": 56,
       "seeAlso": [
         "https://www.ogc.org/ogc/software/1.0"
       ]
@@ -6441,7 +6654,7 @@
       "licenseId": "OGDL-Taiwan-1.0",
       "name": "Taiwan Open Government Data License, version 1.0",
       "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
-      "referenceNumber": 129,
+      "referenceNumber": 626,
       "seeAlso": [
         "https://data.gov.tw/license"
       ]
@@ -6453,7 +6666,7 @@
       "licenseId": "OGL-Canada-2.0",
       "name": "Open Government Licence - Canada",
       "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
-      "referenceNumber": 544,
+      "referenceNumber": 311,
       "seeAlso": [
         "https://open.canada.ca/en/open-government-licence-canada"
       ]
@@ -6465,7 +6678,7 @@
       "licenseId": "OGL-UK-1.0",
       "name": "Open Government Licence v1.0",
       "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
-      "referenceNumber": 168,
+      "referenceNumber": 220,
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/open-government-licence/version/1/"
       ]
@@ -6477,7 +6690,7 @@
       "licenseId": "OGL-UK-2.0",
       "name": "Open Government Licence v2.0",
       "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
-      "referenceNumber": 400,
+      "referenceNumber": 107,
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/"
       ]
@@ -6489,7 +6702,7 @@
       "licenseId": "OGL-UK-3.0",
       "name": "Open Government Licence v3.0",
       "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
-      "referenceNumber": 570,
+      "referenceNumber": 147,
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/"
       ]
@@ -6501,7 +6714,7 @@
       "licenseId": "OGTSL",
       "name": "Open Group Test Suite License",
       "reference": "https://spdx.org/licenses/OGTSL.html",
-      "referenceNumber": 534,
+      "referenceNumber": 649,
       "seeAlso": [
         "http://www.opengroup.org/testing/downloads/The_Open_Group_TSL.txt",
         "https://opensource.org/licenses/OGTSL"
@@ -6514,7 +6727,7 @@
       "licenseId": "OLDAP-1.1",
       "name": "Open LDAP Public License v1.1",
       "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
-      "referenceNumber": 333,
+      "referenceNumber": 559,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=806557a5ad59804ef3a44d5abfbe91d706b0791f"
       ]
@@ -6526,7 +6739,7 @@
       "licenseId": "OLDAP-1.2",
       "name": "Open LDAP Public License v1.2",
       "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
-      "referenceNumber": 281,
+      "referenceNumber": 222,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=42b0383c50c299977b5893ee695cf4e486fb0dc7"
       ]
@@ -6538,7 +6751,7 @@
       "licenseId": "OLDAP-1.3",
       "name": "Open LDAP Public License v1.3",
       "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
-      "referenceNumber": 386,
+      "referenceNumber": 607,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=e5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1"
       ]
@@ -6550,7 +6763,7 @@
       "licenseId": "OLDAP-1.4",
       "name": "Open LDAP Public License v1.4",
       "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
-      "referenceNumber": 105,
+      "referenceNumber": 108,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=c9f95c2f3f2ffb5e0ae55fe7388af75547660941"
       ]
@@ -6562,7 +6775,7 @@
       "licenseId": "OLDAP-2.0",
       "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)",
       "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
-      "referenceNumber": 657,
+      "referenceNumber": 691,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=cbf50f4e1185a21abd4c0a54d3f4341fe28f36ea"
       ]
@@ -6574,7 +6787,7 @@
       "licenseId": "OLDAP-2.0.1",
       "name": "Open LDAP Public License v2.0.1",
       "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
-      "referenceNumber": 654,
+      "referenceNumber": 36,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=b6d68acd14e51ca3aab4428bf26522aa74873f0e"
       ]
@@ -6586,7 +6799,7 @@
       "licenseId": "OLDAP-2.1",
       "name": "Open LDAP Public License v2.1",
       "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
-      "referenceNumber": 170,
+      "referenceNumber": 472,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=b0d176738e96a0d3b9f85cb51e140a86f21be715"
       ]
@@ -6598,7 +6811,7 @@
       "licenseId": "OLDAP-2.2",
       "name": "Open LDAP Public License v2.2",
       "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
-      "referenceNumber": 667,
+      "referenceNumber": 663,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=470b0c18ec67621c85881b2733057fecf4a1acc3"
       ]
@@ -6610,7 +6823,7 @@
       "licenseId": "OLDAP-2.2.1",
       "name": "Open LDAP Public License v2.2.1",
       "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
-      "referenceNumber": 378,
+      "referenceNumber": 278,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=4bc786f34b50aa301be6f5600f58a980070f481e"
       ]
@@ -6622,7 +6835,7 @@
       "licenseId": "OLDAP-2.2.2",
       "name": "Open LDAP Public License 2.2.2",
       "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
-      "referenceNumber": 314,
+      "referenceNumber": 119,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=df2cc1e21eb7c160695f5b7cffd6296c151ba188"
       ]
@@ -6635,7 +6848,7 @@
       "licenseId": "OLDAP-2.3",
       "name": "Open LDAP Public License v2.3",
       "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
-      "referenceNumber": 411,
+      "referenceNumber": 695,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=d32cf54a32d581ab475d23c810b0a7fbaf8d63c3"
       ]
@@ -6647,7 +6860,7 @@
       "licenseId": "OLDAP-2.4",
       "name": "Open LDAP Public License v2.4",
       "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
-      "referenceNumber": 382,
+      "referenceNumber": 120,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=cd1284c4a91a8a380d904eee68d1583f989ed386"
       ]
@@ -6659,7 +6872,7 @@
       "licenseId": "OLDAP-2.5",
       "name": "Open LDAP Public License v2.5",
       "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
-      "referenceNumber": 443,
+      "referenceNumber": 148,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=6852b9d90022e8593c98205413380536b1b5a7cf"
       ]
@@ -6684,7 +6897,7 @@
       "licenseId": "OLDAP-2.7",
       "name": "Open LDAP Public License v2.7",
       "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
-      "referenceNumber": 574,
+      "referenceNumber": 178,
       "seeAlso": [
         "http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=LICENSE;hb=47c2415c1df81556eeb39be6cad458ef87c534a2"
       ]
@@ -6696,7 +6909,7 @@
       "licenseId": "OLDAP-2.8",
       "name": "Open LDAP Public License v2.8",
       "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
-      "referenceNumber": 364,
+      "referenceNumber": 714,
       "seeAlso": [
         "http://www.openldap.org/software/release/license.html"
       ]
@@ -6708,7 +6921,7 @@
       "licenseId": "OLFL-1.3",
       "name": "Open Logistics Foundation License Version 1.3",
       "reference": "https://spdx.org/licenses/OLFL-1.3.html",
-      "referenceNumber": 121,
+      "referenceNumber": 143,
       "seeAlso": [
         "https://openlogisticsfoundation.org/licenses/",
         "https://opensource.org/license/olfl-1-3/"
@@ -6721,11 +6934,24 @@
       "licenseId": "OML",
       "name": "Open Market License",
       "reference": "https://spdx.org/licenses/OML.html",
-      "referenceNumber": 116,
+      "referenceNumber": 379,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Open_Market_License"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/OpenMDW-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "OpenMDW-1.0",
+      "name": "OpenMDW License Agreement v1.0",
+      "reference": "https://spdx.org/licenses/OpenMDW-1.0.html",
+      "referenceNumber": 689,
+      "seeAlso": [
+        "https://raw.githubusercontent.com/OpenMDW/OpenMDW/refs/heads/main/1.0/LICENSE.openmdw",
+        "https://openmdw.ai/license/"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/OpenPBS-2.3.json",
       "isDeprecatedLicenseId": false,
@@ -6733,7 +6959,7 @@
       "licenseId": "OpenPBS-2.3",
       "name": "OpenPBS v2.3 Software License",
       "reference": "https://spdx.org/licenses/OpenPBS-2.3.html",
-      "referenceNumber": 2,
+      "referenceNumber": 390,
       "seeAlso": [
         "https://github.com/adaptivecomputing/torque/blob/master/PBS_License.txt",
         "https://www.mcs.anl.gov/research/projects/openpbs/PBS_License.txt"
@@ -6747,7 +6973,7 @@
       "licenseId": "OpenSSL",
       "name": "OpenSSL License",
       "reference": "https://spdx.org/licenses/OpenSSL.html",
-      "referenceNumber": 275,
+      "referenceNumber": 175,
       "seeAlso": [
         "http://www.openssl.org/source/license.html"
       ]
@@ -6759,7 +6985,7 @@
       "licenseId": "OpenSSL-standalone",
       "name": "OpenSSL License - standalone",
       "reference": "https://spdx.org/licenses/OpenSSL-standalone.html",
-      "referenceNumber": 128,
+      "referenceNumber": 443,
       "seeAlso": [
         "https://library.netapp.com/ecm/ecm_download_file/ECMP1196395",
         "https://hstechdocs.helpsystems.com/manuals/globalscape/archive/cuteftp6/open_ssl_license_agreement.htm"
@@ -6772,7 +6998,7 @@
       "licenseId": "OpenVision",
       "name": "OpenVision License",
       "reference": "https://spdx.org/licenses/OpenVision.html",
-      "referenceNumber": 36,
+      "referenceNumber": 254,
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L66-L98",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html",
@@ -6787,7 +7013,7 @@
       "licenseId": "OPL-1.0",
       "name": "Open Public License v1.0",
       "reference": "https://spdx.org/licenses/OPL-1.0.html",
-      "referenceNumber": 614,
+      "referenceNumber": 348,
       "seeAlso": [
         "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
         "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
@@ -6800,7 +7026,7 @@
       "licenseId": "OPL-UK-3.0",
       "name": "United    Kingdom Open Parliament Licence v3.0",
       "reference": "https://spdx.org/licenses/OPL-UK-3.0.html",
-      "referenceNumber": 285,
+      "referenceNumber": 68,
       "seeAlso": [
         "https://www.parliament.uk/site-information/copyright-parliament/open-parliament-licence/"
       ]
@@ -6812,13 +7038,25 @@
       "licenseId": "OPUBL-1.0",
       "name": "Open Publication License v1.0",
       "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
-      "referenceNumber": 414,
+      "referenceNumber": 413,
       "seeAlso": [
         "http://opencontent.org/openpub/",
         "https://www.debian.org/opl",
         "https://www.ctan.org/license/opl"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/OSC-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "OSC-1.0",
+      "name": "OSC License 1.0",
+      "reference": "https://spdx.org/licenses/OSC-1.0.html",
+      "referenceNumber": 365,
+      "seeAlso": [
+        "https://opensource.org/license/osc-license-1-0"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
       "isDeprecatedLicenseId": false,
@@ -6826,7 +7064,7 @@
       "licenseId": "OSET-PL-2.1",
       "name": "OSET Public License version 2.1",
       "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
-      "referenceNumber": 183,
+      "referenceNumber": 423,
       "seeAlso": [
         "http://www.osetfoundation.org/public-license",
         "https://opensource.org/licenses/OPL-2.1"
@@ -6840,7 +7078,7 @@
       "licenseId": "OSL-1.0",
       "name": "Open Software License 1.0",
       "reference": "https://spdx.org/licenses/OSL-1.0.html",
-      "referenceNumber": 651,
+      "referenceNumber": 673,
       "seeAlso": [
         "https://opensource.org/licenses/OSL-1.0"
       ]
@@ -6853,7 +7091,7 @@
       "licenseId": "OSL-1.1",
       "name": "Open Software License 1.1",
       "reference": "https://spdx.org/licenses/OSL-1.1.html",
-      "referenceNumber": 453,
+      "referenceNumber": 436,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/OSL1.1"
       ]
@@ -6866,7 +7104,7 @@
       "licenseId": "OSL-2.0",
       "name": "Open Software License 2.0",
       "reference": "https://spdx.org/licenses/OSL-2.0.html",
-      "referenceNumber": 179,
+      "referenceNumber": 676,
       "seeAlso": [
         "http://web.archive.org/web/20041020171434/http://www.rosenlaw.com/osl2.0.html"
       ]
@@ -6879,7 +7117,7 @@
       "licenseId": "OSL-2.1",
       "name": "Open Software License 2.1",
       "reference": "https://spdx.org/licenses/OSL-2.1.html",
-      "referenceNumber": 29,
+      "referenceNumber": 286,
       "seeAlso": [
         "http://web.archive.org/web/20050212003940/http://www.rosenlaw.com/osl21.htm",
         "https://opensource.org/licenses/OSL-2.1"
@@ -6893,12 +7131,24 @@
       "licenseId": "OSL-3.0",
       "name": "Open Software License 3.0",
       "reference": "https://spdx.org/licenses/OSL-3.0.html",
-      "referenceNumber": 3,
+      "referenceNumber": 354,
       "seeAlso": [
         "https://web.archive.org/web/20120101081418/http://rosenlaw.com:80/OSL3.0.htm",
         "https://opensource.org/licenses/OSL-3.0"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/OSSP.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "OSSP",
+      "name": "OSSP License",
+      "reference": "https://spdx.org/licenses/OSSP.html",
+      "referenceNumber": 292,
+      "seeAlso": [
+        "https://git.sr.ht/~nabijaczleweli/ossp-var"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/PADL.json",
       "isDeprecatedLicenseId": false,
@@ -6906,11 +7156,24 @@
       "licenseId": "PADL",
       "name": "PADL License",
       "reference": "https://spdx.org/licenses/PADL.html",
-      "referenceNumber": 284,
+      "referenceNumber": 594,
       "seeAlso": [
         "https://git.openldap.org/openldap/openldap/-/blob/master/libraries/libldap/os-local.c?ref_type=heads#L19-23"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ParaType-Free-Font-1.3.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ParaType-Free-Font-1.3",
+      "name": "ParaType Free Font Licensing Agreement v1.3",
+      "reference": "https://spdx.org/licenses/ParaType-Free-Font-1.3.html",
+      "referenceNumber": 625,
+      "seeAlso": [
+        "https://web.archive.org/web/20161209023955/http://www.paratype.ru/public/pt_openlicense_eng.asp",
+        "https://metadata.ftp-master.debian.org/changelogs//main/f/fonts-paratype/fonts-paratype_20181108-4_copyright"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/Parity-6.0.0.json",
       "isDeprecatedLicenseId": false,
@@ -6918,7 +7181,7 @@
       "licenseId": "Parity-6.0.0",
       "name": "The Parity Public License 6.0.0",
       "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
-      "referenceNumber": 241,
+      "referenceNumber": 38,
       "seeAlso": [
         "https://paritylicense.com/versions/6.0.0.html"
       ]
@@ -6930,7 +7193,7 @@
       "licenseId": "Parity-7.0.0",
       "name": "The Parity Public License 7.0.0",
       "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
-      "referenceNumber": 235,
+      "referenceNumber": 633,
       "seeAlso": [
         "https://paritylicense.com/versions/7.0.0.html"
       ]
@@ -6942,7 +7205,7 @@
       "licenseId": "PDDL-1.0",
       "name": "Open Data Commons Public Domain Dedication & License 1.0",
       "reference": "https://spdx.org/licenses/PDDL-1.0.html",
-      "referenceNumber": 684,
+      "referenceNumber": 703,
       "seeAlso": [
         "http://opendatacommons.org/licenses/pddl/1.0/",
         "https://opendatacommons.org/licenses/pddl/"
@@ -6955,7 +7218,7 @@
       "licenseId": "PHP-3.0",
       "name": "PHP License v3.0",
       "reference": "https://spdx.org/licenses/PHP-3.0.html",
-      "referenceNumber": 133,
+      "referenceNumber": 504,
       "seeAlso": [
         "http://www.php.net/license/3_0.txt",
         "https://opensource.org/licenses/PHP-3.0"
@@ -6969,7 +7232,7 @@
       "licenseId": "PHP-3.01",
       "name": "PHP License v3.01",
       "reference": "https://spdx.org/licenses/PHP-3.01.html",
-      "referenceNumber": 221,
+      "referenceNumber": 283,
       "seeAlso": [
         "http://www.php.net/license/3_01.txt"
       ]
@@ -6981,7 +7244,7 @@
       "licenseId": "Pixar",
       "name": "Pixar License",
       "reference": "https://spdx.org/licenses/Pixar.html",
-      "referenceNumber": 435,
+      "referenceNumber": 642,
       "seeAlso": [
         "https://github.com/PixarAnimationStudios/OpenSubdiv/raw/v3_5_0/LICENSE.txt",
         "https://graphics.pixar.com/opensubdiv/docs/license.html",
@@ -6995,7 +7258,7 @@
       "licenseId": "pkgconf",
       "name": "pkgconf License",
       "reference": "https://spdx.org/licenses/pkgconf.html",
-      "referenceNumber": 670,
+      "referenceNumber": 219,
       "seeAlso": [
         "https://github.com/pkgconf/pkgconf/blob/master/cli/main.c#L8"
       ]
@@ -7007,7 +7270,7 @@
       "licenseId": "Plexus",
       "name": "Plexus Classworlds License",
       "reference": "https://spdx.org/licenses/Plexus.html",
-      "referenceNumber": 181,
+      "referenceNumber": 152,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_License"
       ]
@@ -7019,7 +7282,7 @@
       "licenseId": "pnmstitch",
       "name": "pnmstitch License",
       "reference": "https://spdx.org/licenses/pnmstitch.html",
-      "referenceNumber": 691,
+      "referenceNumber": 204,
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/editor/pnmstitch.c#l2"
       ]
@@ -7031,7 +7294,7 @@
       "licenseId": "PolyForm-Noncommercial-1.0.0",
       "name": "PolyForm Noncommercial License 1.0.0",
       "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.0.html",
-      "referenceNumber": 119,
+      "referenceNumber": 623,
       "seeAlso": [
         "https://polyformproject.org/licenses/noncommercial/1.0.0"
       ]
@@ -7043,7 +7306,7 @@
       "licenseId": "PolyForm-Small-Business-1.0.0",
       "name": "PolyForm Small Business License 1.0.0",
       "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.0.0.html",
-      "referenceNumber": 30,
+      "referenceNumber": 503,
       "seeAlso": [
         "https://polyformproject.org/licenses/small-business/1.0.0"
       ]
@@ -7055,7 +7318,7 @@
       "licenseId": "PostgreSQL",
       "name": "PostgreSQL License",
       "reference": "https://spdx.org/licenses/PostgreSQL.html",
-      "referenceNumber": 697,
+      "referenceNumber": 717,
       "seeAlso": [
         "http://www.postgresql.org/about/licence",
         "https://opensource.org/licenses/PostgreSQL"
@@ -7069,7 +7332,7 @@
       "licenseId": "PPL",
       "name": "Peer Production License",
       "reference": "https://spdx.org/licenses/PPL.html",
-      "referenceNumber": 150,
+      "referenceNumber": 669,
       "seeAlso": [
         "https://wiki.p2pfoundation.net/Peer_Production_License",
         "http://www.networkcultures.org/_uploads/%233notebook_telekommunist.pdf"
@@ -7082,7 +7345,7 @@
       "licenseId": "PSF-2.0",
       "name": "Python Software Foundation License 2.0",
       "reference": "https://spdx.org/licenses/PSF-2.0.html",
-      "referenceNumber": 211,
+      "referenceNumber": 490,
       "seeAlso": [
         "https://opensource.org/licenses/Python-2.0",
         "https://matplotlib.org/stable/project/license.html"
@@ -7095,7 +7358,7 @@
       "licenseId": "psfrag",
       "name": "psfrag License",
       "reference": "https://spdx.org/licenses/psfrag.html",
-      "referenceNumber": 423,
+      "referenceNumber": 166,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/psfrag"
       ]
@@ -7107,7 +7370,7 @@
       "licenseId": "psutils",
       "name": "psutils License",
       "reference": "https://spdx.org/licenses/psutils.html",
-      "referenceNumber": 500,
+      "referenceNumber": 259,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/psutils"
       ]
@@ -7120,7 +7383,7 @@
       "licenseId": "Python-2.0",
       "name": "Python License 2.0",
       "reference": "https://spdx.org/licenses/Python-2.0.html",
-      "referenceNumber": 628,
+      "referenceNumber": 110,
       "seeAlso": [
         "https://opensource.org/licenses/Python-2.0"
       ]
@@ -7132,7 +7395,7 @@
       "licenseId": "Python-2.0.1",
       "name": "Python License 2.0.1",
       "reference": "https://spdx.org/licenses/Python-2.0.1.html",
-      "referenceNumber": 586,
+      "referenceNumber": 176,
       "seeAlso": [
         "https://www.python.org/download/releases/2.0.1/license/",
         "https://docs.python.org/3/license.html",
@@ -7146,7 +7409,7 @@
       "licenseId": "python-ldap",
       "name": "Python ldap License",
       "reference": "https://spdx.org/licenses/python-ldap.html",
-      "referenceNumber": 630,
+      "referenceNumber": 273,
       "seeAlso": [
         "https://github.com/python-ldap/python-ldap/blob/main/LICENCE"
       ]
@@ -7158,7 +7421,7 @@
       "licenseId": "Qhull",
       "name": "Qhull License",
       "reference": "https://spdx.org/licenses/Qhull.html",
-      "referenceNumber": 590,
+      "referenceNumber": 59,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Qhull"
       ]
@@ -7171,7 +7434,7 @@
       "licenseId": "QPL-1.0",
       "name": "Q Public License 1.0",
       "reference": "https://spdx.org/licenses/QPL-1.0.html",
-      "referenceNumber": 693,
+      "referenceNumber": 440,
       "seeAlso": [
         "http://doc.qt.nokia.com/3.3/license.html",
         "https://opensource.org/licenses/QPL-1.0",
@@ -7185,7 +7448,7 @@
       "licenseId": "QPL-1.0-INRIA-2004",
       "name": "Q Public License 1.0 - INRIA 2004 variant",
       "reference": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.html",
-      "referenceNumber": 117,
+      "referenceNumber": 320,
       "seeAlso": [
         "https://github.com/maranget/hevea/blob/master/LICENSE"
       ]
@@ -7197,7 +7460,7 @@
       "licenseId": "radvd",
       "name": "radvd License",
       "reference": "https://spdx.org/licenses/radvd.html",
-      "referenceNumber": 678,
+      "referenceNumber": 613,
       "seeAlso": [
         "https://github.com/radvd-project/radvd/blob/master/COPYRIGHT"
       ]
@@ -7209,7 +7472,7 @@
       "licenseId": "Rdisc",
       "name": "Rdisc License",
       "reference": "https://spdx.org/licenses/Rdisc.html",
-      "referenceNumber": 4,
+      "referenceNumber": 158,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
       ]
@@ -7222,7 +7485,7 @@
       "licenseId": "RHeCos-1.1",
       "name": "Red Hat eCos Public License v1.1",
       "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
-      "referenceNumber": 258,
+      "referenceNumber": 612,
       "seeAlso": [
         "http://ecos.sourceware.org/old-license.html"
       ]
@@ -7234,7 +7497,7 @@
       "licenseId": "RPL-1.1",
       "name": "Reciprocal Public License 1.1",
       "reference": "https://spdx.org/licenses/RPL-1.1.html",
-      "referenceNumber": 57,
+      "referenceNumber": 132,
       "seeAlso": [
         "https://opensource.org/licenses/RPL-1.1"
       ]
@@ -7246,7 +7509,7 @@
       "licenseId": "RPL-1.5",
       "name": "Reciprocal Public License 1.5",
       "reference": "https://spdx.org/licenses/RPL-1.5.html",
-      "referenceNumber": 413,
+      "referenceNumber": 300,
       "seeAlso": [
         "https://opensource.org/licenses/RPL-1.5"
       ]
@@ -7259,7 +7522,7 @@
       "licenseId": "RPSL-1.0",
       "name": "RealNetworks Public Source License v1.0",
       "reference": "https://spdx.org/licenses/RPSL-1.0.html",
-      "referenceNumber": 104,
+      "referenceNumber": 27,
       "seeAlso": [
         "https://helixcommunity.org/content/rpsl",
         "https://opensource.org/licenses/RPSL-1.0"
@@ -7272,7 +7535,7 @@
       "licenseId": "RSA-MD",
       "name": "RSA Message-Digest License",
       "reference": "https://spdx.org/licenses/RSA-MD.html",
-      "referenceNumber": 12,
+      "referenceNumber": 538,
       "seeAlso": [
         "http://www.faqs.org/rfcs/rfc1321.html"
       ]
@@ -7284,7 +7547,7 @@
       "licenseId": "RSCPL",
       "name": "Ricoh Source Code Public License",
       "reference": "https://spdx.org/licenses/RSCPL.html",
-      "referenceNumber": 166,
+      "referenceNumber": 571,
       "seeAlso": [
         "http://wayback.archive.org/web/20060715140826/http://www.risource.org/RPL/RPL-1.0A.shtml",
         "https://opensource.org/licenses/RSCPL"
@@ -7298,7 +7561,7 @@
       "licenseId": "Ruby",
       "name": "Ruby License",
       "reference": "https://spdx.org/licenses/Ruby.html",
-      "referenceNumber": 490,
+      "referenceNumber": 325,
       "seeAlso": [
         "https://www.ruby-lang.org/en/about/license.txt"
       ]
@@ -7310,7 +7573,7 @@
       "licenseId": "Ruby-pty",
       "name": "Ruby pty extension license",
       "reference": "https://spdx.org/licenses/Ruby-pty.html",
-      "referenceNumber": 509,
+      "referenceNumber": 678,
       "seeAlso": [
         "https://github.com/ruby/ruby/blob/9f6deaa6888a423720b4b127b5314f0ad26cc2e6/ext/pty/pty.c#L775-L786",
         "https://github.com/ruby/ruby/commit/0a64817fb80016030c03518fb9459f63c11605ea#diff-ef5fa30838d6d0cecad9e675cc50b24628cfe2cb277c346053fafcc36c91c204",
@@ -7324,7 +7587,7 @@
       "licenseId": "SAX-PD",
       "name": "Sax Public Domain Notice",
       "reference": "https://spdx.org/licenses/SAX-PD.html",
-      "referenceNumber": 22,
+      "referenceNumber": 179,
       "seeAlso": [
         "http://www.saxproject.org/copying.html"
       ]
@@ -7336,7 +7599,7 @@
       "licenseId": "SAX-PD-2.0",
       "name": "Sax Public Domain Notice 2.0",
       "reference": "https://spdx.org/licenses/SAX-PD-2.0.html",
-      "referenceNumber": 346,
+      "referenceNumber": 285,
       "seeAlso": [
         "http://www.saxproject.org/copying.html"
       ]
@@ -7348,7 +7611,7 @@
       "licenseId": "Saxpath",
       "name": "Saxpath License",
       "reference": "https://spdx.org/licenses/Saxpath.html",
-      "referenceNumber": 390,
+      "referenceNumber": 47,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Saxpath_License"
       ]
@@ -7360,7 +7623,7 @@
       "licenseId": "SCEA",
       "name": "SCEA Shared Source License",
       "reference": "https://spdx.org/licenses/SCEA.html",
-      "referenceNumber": 484,
+      "referenceNumber": 648,
       "seeAlso": [
         "http://research.scea.com/scea_shared_source_license.html"
       ]
@@ -7372,7 +7635,7 @@
       "licenseId": "SchemeReport",
       "name": "Scheme Language Report License",
       "reference": "https://spdx.org/licenses/SchemeReport.html",
-      "referenceNumber": 91,
+      "referenceNumber": 270,
       "seeAlso": []
     },
     {
@@ -7382,7 +7645,7 @@
       "licenseId": "Sendmail",
       "name": "Sendmail License",
       "reference": "https://spdx.org/licenses/Sendmail.html",
-      "referenceNumber": 266,
+      "referenceNumber": 674,
       "seeAlso": [
         "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
         "https://web.archive.org/web/20160322142305/https://www.sendmail.com/pdfs/open_source/sendmail_license.pdf"
@@ -7395,7 +7658,7 @@
       "licenseId": "Sendmail-8.23",
       "name": "Sendmail License 8.23",
       "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
-      "referenceNumber": 55,
+      "referenceNumber": 552,
       "seeAlso": [
         "https://www.proofpoint.com/sites/default/files/sendmail-license.pdf",
         "https://web.archive.org/web/20181003101040/https://www.proofpoint.com/sites/default/files/sendmail-license.pdf"
@@ -7408,7 +7671,7 @@
       "licenseId": "Sendmail-Open-Source-1.1",
       "name": "Sendmail Open Source License v1.1",
       "reference": "https://spdx.org/licenses/Sendmail-Open-Source-1.1.html",
-      "referenceNumber": 620,
+      "referenceNumber": 719,
       "seeAlso": [
         "https://github.com/trusteddomainproject/OpenDMARC/blob/master/LICENSE.Sendmail"
       ]
@@ -7420,7 +7683,7 @@
       "licenseId": "SGI-B-1.0",
       "name": "SGI Free Software License B v1.0",
       "reference": "https://spdx.org/licenses/SGI-B-1.0.html",
-      "referenceNumber": 56,
+      "referenceNumber": 546,
       "seeAlso": [
         "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.1.0.html"
       ]
@@ -7432,7 +7695,7 @@
       "licenseId": "SGI-B-1.1",
       "name": "SGI Free Software License B v1.1",
       "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
-      "referenceNumber": 296,
+      "referenceNumber": 670,
       "seeAlso": [
         "http://oss.sgi.com/projects/FreeB/"
       ]
@@ -7445,7 +7708,7 @@
       "licenseId": "SGI-B-2.0",
       "name": "SGI Free Software License B v2.0",
       "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
-      "referenceNumber": 617,
+      "referenceNumber": 452,
       "seeAlso": [
         "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.2.0.pdf"
       ]
@@ -7457,11 +7720,23 @@
       "licenseId": "SGI-OpenGL",
       "name": "SGI OpenGL License",
       "reference": "https://spdx.org/licenses/SGI-OpenGL.html",
-      "referenceNumber": 34,
+      "referenceNumber": 500,
       "seeAlso": [
         "https://gitlab.freedesktop.org/mesa/glw/-/blob/master/README?ref_type=heads"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/SGMLUG-PM.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "SGMLUG-PM",
+      "name": "SGMLUG Parser Materials License",
+      "reference": "https://spdx.org/licenses/SGMLUG-PM.html",
+      "referenceNumber": 641,
+      "seeAlso": [
+        "https://gitweb.gentoo.org/repo/gentoo.git/tree/licenses/SGMLUG?id=7d999af4a47bf55e53e54713d98d145f935935c1"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/SGP4.json",
       "isDeprecatedLicenseId": false,
@@ -7469,7 +7744,7 @@
       "licenseId": "SGP4",
       "name": "SGP4 Permission Notice",
       "reference": "https://spdx.org/licenses/SGP4.html",
-      "referenceNumber": 572,
+      "referenceNumber": 228,
       "seeAlso": [
         "https://celestrak.org/publications/AIAA/2006-6753/faq.php"
       ]
@@ -7481,7 +7756,7 @@
       "licenseId": "SHL-0.5",
       "name": "Solderpad Hardware License v0.5",
       "reference": "https://spdx.org/licenses/SHL-0.5.html",
-      "referenceNumber": 267,
+      "referenceNumber": 123,
       "seeAlso": [
         "https://solderpad.org/licenses/SHL-0.5/"
       ]
@@ -7493,7 +7768,7 @@
       "licenseId": "SHL-0.51",
       "name": "Solderpad Hardware License, Version 0.51",
       "reference": "https://spdx.org/licenses/SHL-0.51.html",
-      "referenceNumber": 582,
+      "referenceNumber": 342,
       "seeAlso": [
         "https://solderpad.org/licenses/SHL-0.51/"
       ]
@@ -7505,7 +7780,7 @@
       "licenseId": "SimPL-2.0",
       "name": "Simple Public License 2.0",
       "reference": "https://spdx.org/licenses/SimPL-2.0.html",
-      "referenceNumber": 452,
+      "referenceNumber": 183,
       "seeAlso": [
         "https://opensource.org/licenses/SimPL-2.0"
       ]
@@ -7518,7 +7793,7 @@
       "licenseId": "SISSL",
       "name": "Sun Industry Standards Source License v1.1",
       "reference": "https://spdx.org/licenses/SISSL.html",
-      "referenceNumber": 110,
+      "referenceNumber": 1,
       "seeAlso": [
         "http://www.openoffice.org/licenses/sissl_license.html",
         "https://opensource.org/licenses/SISSL"
@@ -7531,7 +7806,7 @@
       "licenseId": "SISSL-1.2",
       "name": "Sun Industry Standards Source License v1.2",
       "reference": "https://spdx.org/licenses/SISSL-1.2.html",
-      "referenceNumber": 253,
+      "referenceNumber": 506,
       "seeAlso": [
         "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.html"
       ]
@@ -7543,7 +7818,7 @@
       "licenseId": "SL",
       "name": "SL License",
       "reference": "https://spdx.org/licenses/SL.html",
-      "referenceNumber": 83,
+      "referenceNumber": 652,
       "seeAlso": [
         "https://github.com/mtoyoda/sl/blob/master/LICENSE"
       ]
@@ -7556,7 +7831,7 @@
       "licenseId": "Sleepycat",
       "name": "Sleepycat License",
       "reference": "https://spdx.org/licenses/Sleepycat.html",
-      "referenceNumber": 42,
+      "referenceNumber": 576,
       "seeAlso": [
         "https://opensource.org/licenses/Sleepycat"
       ]
@@ -7568,7 +7843,7 @@
       "licenseId": "SMAIL-GPL",
       "name": "SMAIL General Public License",
       "reference": "https://spdx.org/licenses/SMAIL-GPL.html",
-      "referenceNumber": 546,
+      "referenceNumber": 101,
       "seeAlso": [
         "https://sources.debian.org/copyright/license/debianutils/4.11.2/"
       ]
@@ -7581,7 +7856,7 @@
       "licenseId": "SMLNJ",
       "name": "Standard ML of New Jersey License",
       "reference": "https://spdx.org/licenses/SMLNJ.html",
-      "referenceNumber": 81,
+      "referenceNumber": 75,
       "seeAlso": [
         "https://www.smlnj.org/license.html"
       ]
@@ -7593,7 +7868,7 @@
       "licenseId": "SMPPL",
       "name": "Secure Messaging Protocol Public License",
       "reference": "https://spdx.org/licenses/SMPPL.html",
-      "referenceNumber": 579,
+      "referenceNumber": 516,
       "seeAlso": [
         "https://github.com/dcblake/SMP/blob/master/Documentation/License.txt"
       ]
@@ -7605,7 +7880,7 @@
       "licenseId": "SNIA",
       "name": "SNIA Public License 1.1",
       "reference": "https://spdx.org/licenses/SNIA.html",
-      "referenceNumber": 224,
+      "referenceNumber": 389,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/SNIA_Public_License"
       ]
@@ -7617,7 +7892,7 @@
       "licenseId": "snprintf",
       "name": "snprintf License",
       "reference": "https://spdx.org/licenses/snprintf.html",
-      "referenceNumber": 594,
+      "referenceNumber": 49,
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/master/openbsd-compat/bsd-snprintf.c#L2"
       ]
@@ -7629,7 +7904,7 @@
       "licenseId": "SOFA",
       "name": "SOFA Software License",
       "reference": "https://spdx.org/licenses/SOFA.html",
-      "referenceNumber": 375,
+      "referenceNumber": 616,
       "seeAlso": [
         "http://www.iausofa.org/tandc.html"
       ]
@@ -7641,7 +7916,7 @@
       "licenseId": "softSurfer",
       "name": "softSurfer License",
       "reference": "https://spdx.org/licenses/softSurfer.html",
-      "referenceNumber": 593,
+      "referenceNumber": 464,
       "seeAlso": [
         "https://github.com/mm2/Little-CMS/blob/master/src/cmssm.c#L207",
         "https://fedoraproject.org/wiki/Licensing/softSurfer"
@@ -7654,7 +7929,7 @@
       "licenseId": "Soundex",
       "name": "Soundex License",
       "reference": "https://spdx.org/licenses/Soundex.html",
-      "referenceNumber": 374,
+      "referenceNumber": 523,
       "seeAlso": [
         "https://metacpan.org/release/RJBS/Text-Soundex-3.05/source/Soundex.pm#L3-11"
       ]
@@ -7666,7 +7941,7 @@
       "licenseId": "Spencer-86",
       "name": "Spencer License 86",
       "reference": "https://spdx.org/licenses/Spencer-86.html",
-      "referenceNumber": 193,
+      "referenceNumber": 130,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Library_License"
       ]
@@ -7678,7 +7953,7 @@
       "licenseId": "Spencer-94",
       "name": "Spencer License 94",
       "reference": "https://spdx.org/licenses/Spencer-94.html",
-      "referenceNumber": 451,
+      "referenceNumber": 604,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Library_License",
         "https://metacpan.org/release/KNOK/File-MMagic-1.30/source/COPYING#L28"
@@ -7691,7 +7966,7 @@
       "licenseId": "Spencer-99",
       "name": "Spencer License 99",
       "reference": "https://spdx.org/licenses/Spencer-99.html",
-      "referenceNumber": 220,
+      "referenceNumber": 60,
       "seeAlso": [
         "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/regfronts.c"
       ]
@@ -7704,7 +7979,7 @@
       "licenseId": "SPL-1.0",
       "name": "Sun Public License v1.0",
       "reference": "https://spdx.org/licenses/SPL-1.0.html",
-      "referenceNumber": 342,
+      "referenceNumber": 628,
       "seeAlso": [
         "https://opensource.org/licenses/SPL-1.0"
       ]
@@ -7716,7 +7991,7 @@
       "licenseId": "ssh-keyscan",
       "name": "ssh-keyscan License",
       "reference": "https://spdx.org/licenses/ssh-keyscan.html",
-      "referenceNumber": 537,
+      "referenceNumber": 297,
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/master/LICENCE#L82"
       ]
@@ -7728,7 +8003,7 @@
       "licenseId": "SSH-OpenSSH",
       "name": "SSH OpenSSH license",
       "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
-      "referenceNumber": 463,
+      "referenceNumber": 304,
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59838b5fa574cd456d6047b2d4/LICENCE#L10"
       ]
@@ -7740,7 +8015,7 @@
       "licenseId": "SSH-short",
       "name": "SSH short notice",
       "reference": "https://spdx.org/licenses/SSH-short.html",
-      "referenceNumber": 573,
+      "referenceNumber": 182,
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59838b5fa574cd456d6047b2d4/pathnames.h",
         "http://web.mit.edu/kolya/.f/root/athena.mit.edu/sipb.mit.edu/project/openssh/OldFiles/src/openssh-2.9.9p2/ssh-add.1",
@@ -7754,7 +8029,7 @@
       "licenseId": "SSLeay-standalone",
       "name": "SSLeay License - standalone",
       "reference": "https://spdx.org/licenses/SSLeay-standalone.html",
-      "referenceNumber": 96,
+      "referenceNumber": 382,
       "seeAlso": [
         "https://www.tq-group.com/filedownloads/files/software-license-conditions/OriginalSSLeay/OriginalSSLeay.pdf"
       ]
@@ -7766,7 +8041,7 @@
       "licenseId": "SSPL-1.0",
       "name": "Server Side Public License, v 1",
       "reference": "https://spdx.org/licenses/SSPL-1.0.html",
-      "referenceNumber": 664,
+      "referenceNumber": 527,
       "seeAlso": [
         "https://www.mongodb.com/licensing/server-side-public-license"
       ]
@@ -7779,7 +8054,7 @@
       "licenseId": "StandardML-NJ",
       "name": "Standard ML of New Jersey License",
       "reference": "https://spdx.org/licenses/StandardML-NJ.html",
-      "referenceNumber": 501,
+      "referenceNumber": 677,
       "seeAlso": [
         "https://www.smlnj.org/license.html"
       ]
@@ -7791,7 +8066,7 @@
       "licenseId": "SugarCRM-1.1.3",
       "name": "SugarCRM Public License v1.1.3",
       "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
-      "referenceNumber": 222,
+      "referenceNumber": 197,
       "seeAlso": [
         "http://www.sugarcrm.com/crm/SPL"
       ]
@@ -7803,7 +8078,7 @@
       "licenseId": "SUL-1.0",
       "name": "Sustainable Use License v1.0",
       "reference": "https://spdx.org/licenses/SUL-1.0.html",
-      "referenceNumber": 557,
+      "referenceNumber": 146,
       "seeAlso": [
         "https://github.com/n8n-io/n8n/blob/master/LICENSE.md"
       ]
@@ -7815,7 +8090,7 @@
       "licenseId": "Sun-PPP",
       "name": "Sun PPP License",
       "reference": "https://spdx.org/licenses/Sun-PPP.html",
-      "referenceNumber": 39,
+      "referenceNumber": 98,
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/eap.c#L7-L16"
       ]
@@ -7827,7 +8102,7 @@
       "licenseId": "Sun-PPP-2000",
       "name": "Sun PPP License (2000)",
       "reference": "https://spdx.org/licenses/Sun-PPP-2000.html",
-      "referenceNumber": 70,
+      "referenceNumber": 145,
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/modules/ppp_ahdlc.c#L7-L19"
       ]
@@ -7839,7 +8114,7 @@
       "licenseId": "SunPro",
       "name": "SunPro License",
       "reference": "https://spdx.org/licenses/SunPro.html",
-      "referenceNumber": 395,
+      "referenceNumber": 267,
       "seeAlso": [
         "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e_acosh.c",
         "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e_lgammal.c"
@@ -7852,7 +8127,7 @@
       "licenseId": "SWL",
       "name": "Scheme Widget Library (SWL) Software License Agreement",
       "reference": "https://spdx.org/licenses/SWL.html",
-      "referenceNumber": 196,
+      "referenceNumber": 174,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/SWL"
       ]
@@ -7864,7 +8139,7 @@
       "licenseId": "swrule",
       "name": "swrule License",
       "reference": "https://spdx.org/licenses/swrule.html",
-      "referenceNumber": 348,
+      "referenceNumber": 93,
       "seeAlso": [
         "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/misc/swrule.sty"
       ]
@@ -7876,7 +8151,7 @@
       "licenseId": "Symlinks",
       "name": "Symlinks License",
       "reference": "https://spdx.org/licenses/Symlinks.html",
-      "referenceNumber": 517,
+      "referenceNumber": 473,
       "seeAlso": [
         "https://www.mail-archive.com/debian-bugs-rc@lists.debian.org/msg11494.html"
       ]
@@ -7888,7 +8163,7 @@
       "licenseId": "TAPR-OHL-1.0",
       "name": "TAPR Open Hardware License v1.0",
       "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
-      "referenceNumber": 80,
+      "referenceNumber": 153,
       "seeAlso": [
         "https://www.tapr.org/OHL"
       ]
@@ -7900,7 +8175,7 @@
       "licenseId": "TCL",
       "name": "TCL/TK License",
       "reference": "https://spdx.org/licenses/TCL.html",
-      "referenceNumber": 625,
+      "referenceNumber": 53,
       "seeAlso": [
         "http://www.tcl.tk/software/tcltk/license.html",
         "https://fedoraproject.org/wiki/Licensing/TCL"
@@ -7913,11 +8188,23 @@
       "licenseId": "TCP-wrappers",
       "name": "TCP Wrappers License",
       "reference": "https://spdx.org/licenses/TCP-wrappers.html",
-      "referenceNumber": 278,
+      "referenceNumber": 539,
       "seeAlso": [
         "http://rc.quest.com/topics/openssh/license.php#tcpwrappers"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/TekHVC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "TekHVC",
+      "name": "TekHVC License",
+      "reference": "https://spdx.org/licenses/TekHVC.html",
+      "referenceNumber": 548,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/lib/libx11/-/blob/master/COPYING?ref_type=heads#L138-171"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/TermReadKey.json",
       "isDeprecatedLicenseId": false,
@@ -7925,7 +8212,7 @@
       "licenseId": "TermReadKey",
       "name": "TermReadKey License",
       "reference": "https://spdx.org/licenses/TermReadKey.html",
-      "referenceNumber": 619,
+      "referenceNumber": 172,
       "seeAlso": [
         "https://github.com/jonathanstowe/TermReadKey/blob/master/README#L9-L10"
       ]
@@ -7937,7 +8224,7 @@
       "licenseId": "TGPPL-1.0",
       "name": "Transitive Grace Period Public Licence 1.0",
       "reference": "https://spdx.org/licenses/TGPPL-1.0.html",
-      "referenceNumber": 142,
+      "referenceNumber": 245,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TGPPL",
         "https://tahoe-lafs.org/trac/tahoe-lafs/browser/trunk/COPYING.TGPPL.rst"
@@ -7950,7 +8237,7 @@
       "licenseId": "ThirdEye",
       "name": "ThirdEye License",
       "reference": "https://spdx.org/licenses/ThirdEye.html",
-      "referenceNumber": 403,
+      "referenceNumber": 240,
       "seeAlso": [
         "https://sourceware.org/cgit/binutils-gdb/tree/include/coff/symconst.h#n11"
       ]
@@ -7962,7 +8249,7 @@
       "licenseId": "threeparttable",
       "name": "threeparttable License",
       "reference": "https://spdx.org/licenses/threeparttable.html",
-      "referenceNumber": 14,
+      "referenceNumber": 686,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Threeparttable"
       ]
@@ -7974,7 +8261,7 @@
       "licenseId": "TMate",
       "name": "TMate Open Source License",
       "reference": "https://spdx.org/licenses/TMate.html",
-      "referenceNumber": 176,
+      "referenceNumber": 313,
       "seeAlso": [
         "http://svnkit.com/license.html"
       ]
@@ -7986,7 +8273,7 @@
       "licenseId": "TORQUE-1.1",
       "name": "TORQUE v2.5+ Software License v1.1",
       "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
-      "referenceNumber": 214,
+      "referenceNumber": 371,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TORQUEv1.1"
       ]
@@ -7998,7 +8285,7 @@
       "licenseId": "TOSL",
       "name": "Trusster Open Source License",
       "reference": "https://spdx.org/licenses/TOSL.html",
-      "referenceNumber": 416,
+      "referenceNumber": 125,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TOSL"
       ]
@@ -8010,7 +8297,7 @@
       "licenseId": "TPDL",
       "name": "Time::ParseDate License",
       "reference": "https://spdx.org/licenses/TPDL.html",
-      "referenceNumber": 666,
+      "referenceNumber": 589,
       "seeAlso": [
         "https://metacpan.org/pod/Time::ParseDate#LICENSE"
       ]
@@ -8022,7 +8309,7 @@
       "licenseId": "TPL-1.0",
       "name": "THOR Public License 1.0",
       "reference": "https://spdx.org/licenses/TPL-1.0.html",
-      "referenceNumber": 540,
+      "referenceNumber": 531,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:ThorPublicLicense"
       ]
@@ -8034,7 +8321,7 @@
       "licenseId": "TrustedQSL",
       "name": "TrustedQSL License",
       "reference": "https://spdx.org/licenses/TrustedQSL.html",
-      "referenceNumber": 37,
+      "referenceNumber": 661,
       "seeAlso": [
         "https://sourceforge.net/p/trustedqsl/tqsl/ci/master/tree/LICENSE.txt"
       ]
@@ -8046,7 +8333,7 @@
       "licenseId": "TTWL",
       "name": "Text-Tabs+Wrap License",
       "reference": "https://spdx.org/licenses/TTWL.html",
-      "referenceNumber": 598,
+      "referenceNumber": 432,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TTWL",
         "https://github.com/ap/Text-Tabs/blob/master/lib.modern/Text/Tabs.pm#L148"
@@ -8059,7 +8346,7 @@
       "licenseId": "TTYP0",
       "name": "TTYP0 License",
       "reference": "https://spdx.org/licenses/TTYP0.html",
-      "referenceNumber": 236,
+      "referenceNumber": 88,
       "seeAlso": [
         "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/"
       ]
@@ -8071,7 +8358,7 @@
       "licenseId": "TU-Berlin-1.0",
       "name": "Technische Universitaet Berlin License 1.0",
       "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
-      "referenceNumber": 106,
+      "referenceNumber": 411,
       "seeAlso": [
         "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9f526803d9680/gsm/COPYRIGHT"
       ]
@@ -8083,7 +8370,7 @@
       "licenseId": "TU-Berlin-2.0",
       "name": "Technische Universitaet Berlin License 2.0",
       "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
-      "referenceNumber": 669,
+      "referenceNumber": 15,
       "seeAlso": [
         "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39e438a015da50035/licences/libgsm.txt"
       ]
@@ -8095,7 +8382,7 @@
       "licenseId": "Ubuntu-font-1.0",
       "name": "Ubuntu Font Licence v1.0",
       "reference": "https://spdx.org/licenses/Ubuntu-font-1.0.html",
-      "referenceNumber": 268,
+      "referenceNumber": 274,
       "seeAlso": [
         "https://ubuntu.com/legal/font-licence",
         "https://assets.ubuntu.com/v1/81e5605d-ubuntu-font-licence-1.0.txt"
@@ -8108,7 +8395,7 @@
       "licenseId": "UCAR",
       "name": "UCAR License",
       "reference": "https://spdx.org/licenses/UCAR.html",
-      "referenceNumber": 353,
+      "referenceNumber": 656,
       "seeAlso": [
         "https://github.com/Unidata/UDUNITS-2/blob/master/COPYRIGHT"
       ]
@@ -8120,7 +8407,7 @@
       "licenseId": "UCL-1.0",
       "name": "Upstream Compatibility License v1.0",
       "reference": "https://spdx.org/licenses/UCL-1.0.html",
-      "referenceNumber": 611,
+      "referenceNumber": 70,
       "seeAlso": [
         "https://opensource.org/licenses/UCL-1.0"
       ]
@@ -8132,7 +8419,7 @@
       "licenseId": "ulem",
       "name": "ulem License",
       "reference": "https://spdx.org/licenses/ulem.html",
-      "referenceNumber": 514,
+      "referenceNumber": 289,
       "seeAlso": [
         "https://mirrors.ctan.org/macros/latex/contrib/ulem/README"
       ]
@@ -8144,7 +8431,7 @@
       "licenseId": "UMich-Merit",
       "name": "Michigan/Merit Networks License",
       "reference": "https://spdx.org/licenses/UMich-Merit.html",
-      "referenceNumber": 48,
+      "referenceNumber": 312,
       "seeAlso": [
         "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L64"
       ]
@@ -8156,7 +8443,7 @@
       "licenseId": "Unicode-3.0",
       "name": "Unicode License v3",
       "reference": "https://spdx.org/licenses/Unicode-3.0.html",
-      "referenceNumber": 308,
+      "referenceNumber": 37,
       "seeAlso": [
         "https://www.unicode.org/license.txt"
       ]
@@ -8168,7 +8455,7 @@
       "licenseId": "Unicode-DFS-2015",
       "name": "Unicode License Agreement - Data Files and Software (2015)",
       "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
-      "referenceNumber": 254,
+      "referenceNumber": 361,
       "seeAlso": [
         "https://web.archive.org/web/20151224134844/http://unicode.org/copyright.html"
       ]
@@ -8180,7 +8467,7 @@
       "licenseId": "Unicode-DFS-2016",
       "name": "Unicode License Agreement - Data Files and Software (2016)",
       "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
-      "referenceNumber": 309,
+      "referenceNumber": 501,
       "seeAlso": [
         "https://www.unicode.org/license.txt",
         "http://web.archive.org/web/20160823201924/http://www.unicode.org/copyright.html#License",
@@ -8194,7 +8481,7 @@
       "licenseId": "Unicode-TOU",
       "name": "Unicode Terms of Use",
       "reference": "https://spdx.org/licenses/Unicode-TOU.html",
-      "referenceNumber": 115,
+      "referenceNumber": 658,
       "seeAlso": [
         "http://web.archive.org/web/20140704074106/http://www.unicode.org/copyright.html",
         "http://www.unicode.org/copyright.html"
@@ -8207,7 +8494,7 @@
       "licenseId": "UnixCrypt",
       "name": "UnixCrypt License",
       "reference": "https://spdx.org/licenses/UnixCrypt.html",
-      "referenceNumber": 180,
+      "referenceNumber": 425,
       "seeAlso": [
         "https://foss.heptapod.net/python-libs/passlib/-/blob/branch/stable/LICENSE#L70",
         "https://opensource.apple.com/source/JBoss/JBoss-737/jboss-all/jetty/src/main/org/mortbay/util/UnixCrypt.java.auto.html",
@@ -8222,7 +8509,7 @@
       "licenseId": "Unlicense",
       "name": "The Unlicense",
       "reference": "https://spdx.org/licenses/Unlicense.html",
-      "referenceNumber": 337,
+      "referenceNumber": 141,
       "seeAlso": [
         "https://unlicense.org/"
       ]
@@ -8234,7 +8521,7 @@
       "licenseId": "Unlicense-libtelnet",
       "name": "Unlicense - libtelnet variant",
       "reference": "https://spdx.org/licenses/Unlicense-libtelnet.html",
-      "referenceNumber": 113,
+      "referenceNumber": 271,
       "seeAlso": [
         "https://github.com/seanmiddleditch/libtelnet/blob/develop/COPYING"
       ]
@@ -8246,11 +8533,23 @@
       "licenseId": "Unlicense-libwhirlpool",
       "name": "Unlicense - libwhirlpool variant",
       "reference": "https://spdx.org/licenses/Unlicense-libwhirlpool.html",
-      "referenceNumber": 565,
+      "referenceNumber": 19,
       "seeAlso": [
         "https://github.com/dfateyev/libwhirlpool/blob/master/README#L27"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/UnRAR.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "UnRAR",
+      "name": "UnRAR License",
+      "reference": "https://spdx.org/licenses/UnRAR.html",
+      "referenceNumber": 307,
+      "seeAlso": [
+        "https://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/LICENSES/unRAR.txt"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
       "isDeprecatedLicenseId": false,
@@ -8259,7 +8558,7 @@
       "licenseId": "UPL-1.0",
       "name": "Universal Permissive License v1.0",
       "reference": "https://spdx.org/licenses/UPL-1.0.html",
-      "referenceNumber": 88,
+      "referenceNumber": 138,
       "seeAlso": [
         "https://opensource.org/licenses/UPL"
       ]
@@ -8271,7 +8570,7 @@
       "licenseId": "URT-RLE",
       "name": "Utah Raster Toolkit Run Length Encoded License",
       "reference": "https://spdx.org/licenses/URT-RLE.html",
-      "referenceNumber": 380,
+      "referenceNumber": 135,
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/converter/other/pnmtorle.c",
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/converter/other/rletopnm.c"
@@ -8285,11 +8584,23 @@
       "licenseId": "Vim",
       "name": "Vim License",
       "reference": "https://spdx.org/licenses/Vim.html",
-      "referenceNumber": 327,
+      "referenceNumber": 266,
       "seeAlso": [
         "http://vimdoc.sourceforge.net/htmldoc/uganda.html"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Vixie-Cron.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Vixie-Cron",
+      "name": "Vixie Cron License",
+      "reference": "https://spdx.org/licenses/Vixie-Cron.html",
+      "referenceNumber": 518,
+      "seeAlso": [
+        "https://github.com/vixie/cron/tree/545b3f5246824a9cda5905eeb7cf019c95e66995"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/VOSTROM.json",
       "isDeprecatedLicenseId": false,
@@ -8297,7 +8608,7 @@
       "licenseId": "VOSTROM",
       "name": "VOSTROM Public License for Open Source",
       "reference": "https://spdx.org/licenses/VOSTROM.html",
-      "referenceNumber": 575,
+      "referenceNumber": 65,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/VOSTROM"
       ]
@@ -8309,7 +8620,7 @@
       "licenseId": "VSL-1.0",
       "name": "Vovida Software License v1.0",
       "reference": "https://spdx.org/licenses/VSL-1.0.html",
-      "referenceNumber": 562,
+      "referenceNumber": 97,
       "seeAlso": [
         "https://opensource.org/licenses/VSL-1.0"
       ]
@@ -8322,7 +8633,7 @@
       "licenseId": "W3C",
       "name": "W3C Software Notice and License (2002-12-31)",
       "reference": "https://spdx.org/licenses/W3C.html",
-      "referenceNumber": 479,
+      "referenceNumber": 488,
       "seeAlso": [
         "http://www.w3.org/Consortium/Legal/2002/copyright-software-20021231.html",
         "https://opensource.org/licenses/W3C"
@@ -8335,7 +8646,7 @@
       "licenseId": "W3C-19980720",
       "name": "W3C Software Notice and License (1998-07-20)",
       "reference": "https://spdx.org/licenses/W3C-19980720.html",
-      "referenceNumber": 365,
+      "referenceNumber": 50,
       "seeAlso": [
         "http://www.w3.org/Consortium/Legal/copyright-software-19980720.html"
       ]
@@ -8347,7 +8658,7 @@
       "licenseId": "W3C-20150513",
       "name": "W3C Software Notice and Document License (2015-05-13)",
       "reference": "https://spdx.org/licenses/W3C-20150513.html",
-      "referenceNumber": 295,
+      "referenceNumber": 513,
       "seeAlso": [
         "https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document",
         "https://www.w3.org/copyright/software-license-2015/",
@@ -8361,7 +8672,7 @@
       "licenseId": "w3m",
       "name": "w3m License",
       "reference": "https://spdx.org/licenses/w3m.html",
-      "referenceNumber": 141,
+      "referenceNumber": 170,
       "seeAlso": [
         "https://github.com/tats/w3m/blob/master/COPYING"
       ]
@@ -8374,7 +8685,7 @@
       "licenseId": "Watcom-1.0",
       "name": "Sybase Open Watcom Public License 1.0",
       "reference": "https://spdx.org/licenses/Watcom-1.0.html",
-      "referenceNumber": 527,
+      "referenceNumber": 684,
       "seeAlso": [
         "https://opensource.org/licenses/Watcom-1.0"
       ]
@@ -8386,11 +8697,23 @@
       "licenseId": "Widget-Workshop",
       "name": "Widget Workshop License",
       "reference": "https://spdx.org/licenses/Widget-Workshop.html",
-      "referenceNumber": 522,
+      "referenceNumber": 630,
       "seeAlso": [
         "https://github.com/novnc/noVNC/blob/master/core/crypto/des.js#L24"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/WordNet.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "WordNet",
+      "name": "WordNet License",
+      "reference": "https://spdx.org/licenses/WordNet.html",
+      "referenceNumber": 314,
+      "seeAlso": [
+        "https://wordnet.princeton.edu/license-and-commercial-use"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
       "isDeprecatedLicenseId": false,
@@ -8398,11 +8721,24 @@
       "licenseId": "Wsuipa",
       "name": "Wsuipa License",
       "reference": "https://spdx.org/licenses/Wsuipa.html",
-      "referenceNumber": 564,
+      "referenceNumber": 376,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Wsuipa"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/WTFNMFPL.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "WTFNMFPL",
+      "name": "Do What The F*ck You Want To But It's Not My Fault Public License",
+      "reference": "https://spdx.org/licenses/WTFNMFPL.html",
+      "referenceNumber": 568,
+      "seeAlso": [
+        "https://github.com/adversary-org/wtfnmf/raw/refs/tags/1.0/COPYING.WTFNMFPL",
+        "https://github.com/adversary-org/wtfnmf/raw/3f2cd8235a64350a57a51b9739715edaea63ec1a/COPYING.WTFNMFPL-utf8"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/WTFPL.json",
       "isDeprecatedLicenseId": false,
@@ -8411,7 +8747,7 @@
       "licenseId": "WTFPL",
       "name": "Do What The F*ck You Want To Public License",
       "reference": "https://spdx.org/licenses/WTFPL.html",
-      "referenceNumber": 418,
+      "referenceNumber": 455,
       "seeAlso": [
         "http://www.wtfpl.net/about/",
         "http://sam.zoy.org/wtfpl/COPYING"
@@ -8424,7 +8760,7 @@
       "licenseId": "wwl",
       "name": "WWL License",
       "reference": "https://spdx.org/licenses/wwl.html",
-      "referenceNumber": 627,
+      "referenceNumber": 191,
       "seeAlso": [
         "http://www.db.net/downloads/wwl+db-1.3.tgz"
       ]
@@ -8436,7 +8772,7 @@
       "licenseId": "wxWindows",
       "name": "wxWindows Library License",
       "reference": "https://spdx.org/licenses/wxWindows.html",
-      "referenceNumber": 431,
+      "referenceNumber": 346,
       "seeAlso": [
         "https://opensource.org/licenses/WXwindows"
       ]
@@ -8449,7 +8785,7 @@
       "licenseId": "X11",
       "name": "X11 License",
       "reference": "https://spdx.org/licenses/X11.html",
-      "referenceNumber": 0,
+      "referenceNumber": 458,
       "seeAlso": [
         "http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3"
       ]
@@ -8461,11 +8797,23 @@
       "licenseId": "X11-distribute-modifications-variant",
       "name": "X11 License Distribution Modification Variant",
       "reference": "https://spdx.org/licenses/X11-distribute-modifications-variant.html",
-      "referenceNumber": 302,
+      "referenceNumber": 705,
       "seeAlso": [
         "https://github.com/mirror/ncurses/blob/master/COPYING"
       ]
     },
+    {
+      "detailsUrl": "https://spdx.org/licenses/X11-no-permit-persons.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "X11-no-permit-persons",
+      "name": "X11 no permit persons clause",
+      "reference": "https://spdx.org/licenses/X11-no-permit-persons.html",
+      "referenceNumber": 258,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/lib/libxinerama/-/blob/cc22c2f60c3862482562955116d5455263b443dc/COPYING#L44-66"
+      ]
+    },
     {
       "detailsUrl": "https://spdx.org/licenses/X11-swapped.json",
       "isDeprecatedLicenseId": false,
@@ -8473,7 +8821,7 @@
       "licenseId": "X11-swapped",
       "name": "X11 swapped final paragraphs",
       "reference": "https://spdx.org/licenses/X11-swapped.html",
-      "referenceNumber": 248,
+      "referenceNumber": 569,
       "seeAlso": [
         "https://github.com/fedeinthemix/chez-srfi/blob/master/srfi/LICENSE"
       ]
@@ -8485,7 +8833,7 @@
       "licenseId": "Xdebug-1.03",
       "name": "Xdebug License v 1.03",
       "reference": "https://spdx.org/licenses/Xdebug-1.03.html",
-      "referenceNumber": 109,
+      "referenceNumber": 262,
       "seeAlso": [
         "https://github.com/xdebug/xdebug/blob/master/LICENSE"
       ]
@@ -8497,7 +8845,7 @@
       "licenseId": "Xerox",
       "name": "Xerox License",
       "reference": "https://spdx.org/licenses/Xerox.html",
-      "referenceNumber": 615,
+      "referenceNumber": 533,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Xerox"
       ]
@@ -8509,7 +8857,7 @@
       "licenseId": "Xfig",
       "name": "Xfig License",
       "reference": "https://spdx.org/licenses/Xfig.html",
-      "referenceNumber": 125,
+      "referenceNumber": 404,
       "seeAlso": [
         "https://github.com/Distrotech/transfig/blob/master/transfig/transfig.c",
         "https://fedoraproject.org/wiki/Licensing:MIT#Xfig_Variant",
@@ -8524,7 +8872,7 @@
       "licenseId": "XFree86-1.1",
       "name": "XFree86 License 1.1",
       "reference": "https://spdx.org/licenses/XFree86-1.1.html",
-      "referenceNumber": 646,
+      "referenceNumber": 624,
       "seeAlso": [
         "http://www.xfree86.org/current/LICENSE4.html"
       ]
@@ -8537,7 +8885,7 @@
       "licenseId": "xinetd",
       "name": "xinetd License",
       "reference": "https://spdx.org/licenses/xinetd.html",
-      "referenceNumber": 93,
+      "referenceNumber": 634,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Xinetd_License"
       ]
@@ -8549,7 +8897,7 @@
       "licenseId": "xkeyboard-config-Zinoviev",
       "name": "xkeyboard-config Zinoviev License",
       "reference": "https://spdx.org/licenses/xkeyboard-config-Zinoviev.html",
-      "referenceNumber": 212,
+      "referenceNumber": 592,
       "seeAlso": [
         "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/blob/master/COPYING?ref_type=heads#L178"
       ]
@@ -8561,7 +8909,7 @@
       "licenseId": "xlock",
       "name": "xlock License",
       "reference": "https://spdx.org/licenses/xlock.html",
-      "referenceNumber": 362,
+      "referenceNumber": 194,
       "seeAlso": [
         "https://fossies.org/linux/tiff/contrib/ras/ras2tif.c"
       ]
@@ -8573,7 +8921,7 @@
       "licenseId": "Xnet",
       "name": "X.Net License",
       "reference": "https://spdx.org/licenses/Xnet.html",
-      "referenceNumber": 470,
+      "referenceNumber": 364,
       "seeAlso": [
         "https://opensource.org/licenses/Xnet"
       ]
@@ -8585,7 +8933,7 @@
       "licenseId": "xpp",
       "name": "XPP License",
       "reference": "https://spdx.org/licenses/xpp.html",
-      "referenceNumber": 290,
+      "referenceNumber": 52,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/xpp"
       ]
@@ -8597,7 +8945,7 @@
       "licenseId": "XSkat",
       "name": "XSkat License",
       "reference": "https://spdx.org/licenses/XSkat.html",
-      "referenceNumber": 293,
+      "referenceNumber": 593,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/XSkat_License"
       ]
@@ -8609,7 +8957,7 @@
       "licenseId": "xzoom",
       "name": "xzoom License",
       "reference": "https://spdx.org/licenses/xzoom.html",
-      "referenceNumber": 90,
+      "referenceNumber": 268,
       "seeAlso": [
         "https://metadata.ftp-master.debian.org/changelogs//main/x/xzoom/xzoom_0.3-27_copyright"
       ]
@@ -8621,7 +8969,7 @@
       "licenseId": "YPL-1.0",
       "name": "Yahoo! Public License v1.0",
       "reference": "https://spdx.org/licenses/YPL-1.0.html",
-      "referenceNumber": 294,
+      "referenceNumber": 189,
       "seeAlso": [
         "http://www.zimbra.com/license/yahoo_public_license_1.0.html"
       ]
@@ -8634,7 +8982,7 @@
       "licenseId": "YPL-1.1",
       "name": "Yahoo! Public License v1.1",
       "reference": "https://spdx.org/licenses/YPL-1.1.html",
-      "referenceNumber": 481,
+      "referenceNumber": 407,
       "seeAlso": [
         "http://www.zimbra.com/license/yahoo_public_license_1.1.html"
       ]
@@ -8646,7 +8994,7 @@
       "licenseId": "Zed",
       "name": "Zed License",
       "reference": "https://spdx.org/licenses/Zed.html",
-      "referenceNumber": 189,
+      "referenceNumber": 608,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Zed"
       ]
@@ -8658,7 +9006,7 @@
       "licenseId": "Zeeff",
       "name": "Zeeff License",
       "reference": "https://spdx.org/licenses/Zeeff.html",
-      "referenceNumber": 551,
+      "referenceNumber": 42,
       "seeAlso": [
         "ftp://ftp.tin.org/pub/news/utils/newsx/newsx-1.6.tar.gz"
       ]
@@ -8671,7 +9019,7 @@
       "licenseId": "Zend-2.0",
       "name": "Zend License v2.0",
       "reference": "https://spdx.org/licenses/Zend-2.0.html",
-      "referenceNumber": 444,
+      "referenceNumber": 536,
       "seeAlso": [
         "https://web.archive.org/web/20130517195954/http://www.zend.com/license/2_00.txt"
       ]
@@ -8684,7 +9032,7 @@
       "licenseId": "Zimbra-1.3",
       "name": "Zimbra Public License v1.3",
       "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
-      "referenceNumber": 26,
+      "referenceNumber": 456,
       "seeAlso": [
         "http://web.archive.org/web/20100302225219/http://www.zimbra.com/license/zimbra-public-license-1-3.html"
       ]
@@ -8696,7 +9044,7 @@
       "licenseId": "Zimbra-1.4",
       "name": "Zimbra Public License v1.4",
       "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
-      "referenceNumber": 330,
+      "referenceNumber": 483,
       "seeAlso": [
         "http://www.zimbra.com/legal/zimbra-public-license-1-4"
       ]
@@ -8709,7 +9057,7 @@
       "licenseId": "Zlib",
       "name": "zlib License",
       "reference": "https://spdx.org/licenses/Zlib.html",
-      "referenceNumber": 421,
+      "referenceNumber": 664,
       "seeAlso": [
         "http://www.zlib.net/zlib_license.html",
         "https://opensource.org/licenses/Zlib"
@@ -8722,7 +9070,7 @@
       "licenseId": "zlib-acknowledgement",
       "name": "zlib/libpng License with Acknowledgement",
       "reference": "https://spdx.org/licenses/zlib-acknowledgement.html",
-      "referenceNumber": 188,
+      "referenceNumber": 405,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/ZlibWithAcknowledgement"
       ]
@@ -8734,7 +9082,7 @@
       "licenseId": "ZPL-1.1",
       "name": "Zope Public License 1.1",
       "reference": "https://spdx.org/licenses/ZPL-1.1.html",
-      "referenceNumber": 597,
+      "referenceNumber": 137,
       "seeAlso": [
         "http://old.zope.org/Resources/License/ZPL-1.1"
       ]
@@ -8747,7 +9095,7 @@
       "licenseId": "ZPL-2.0",
       "name": "Zope Public License 2.0",
       "reference": "https://spdx.org/licenses/ZPL-2.0.html",
-      "referenceNumber": 555,
+      "referenceNumber": 519,
       "seeAlso": [
         "http://old.zope.org/Resources/License/ZPL-2.0",
         "https://opensource.org/licenses/ZPL-2.0"
@@ -8761,11 +9109,11 @@
       "licenseId": "ZPL-2.1",
       "name": "Zope Public License 2.1",
       "reference": "https://spdx.org/licenses/ZPL-2.1.html",
-      "referenceNumber": 272,
+      "referenceNumber": 603,
       "seeAlso": [
         "http://old.zope.org/Resources/ZPL/"
       ]
     }
   ],
-  "releaseDate": "2025-07-01T00:00:00Z"
+  "releaseDate": "2026-02-20T00:00:00Z"
 }
\ No newline at end of file

