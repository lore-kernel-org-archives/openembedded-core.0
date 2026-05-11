Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03F5CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:51:30 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50297.1778507485590061798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 06:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=HgIhe7Ts;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=cq8/1Z+d;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B2E61EC02FC;
	Mon, 11 May 2026 09:51:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 11 May 2026 09:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1778507484; x=1778593884; bh=e4
	9LUDUI3fLq88ljRkuwcmOOBpJfMk49ZZpjNJEf8Y0=; b=HgIhe7TsgWhBD25+dT
	8fcxT84XzKe4dzwvm/Fus7MpdqJ3f4E3C/7dQ2IoHTPXiqQ6NUtqyF9AVpehV6WL
	ZZqvDmWXyjMbdNMxq5NYkUTXAbDHBnFX4FcKXHoMzOxkg/X/9uzykKKrEg83kerT
	+qyeb9CmLH75U5h8wGA/UclwnxsQx9pyi54hDna/oP8L00swoZEGmCgfj6M9L2CG
	jteuwUP9JbjEWU0Ben1PEv9GNt2M4KPQAAyydBVBPLxWzRo0F5zaJ3TNLBh/bc/P
	j7x+RH8rQUNQ1dhOyLTaXZrZnDKxiH7Bm13KELAhmfzGtkgAXgt9qxTNIbxrysZa
	Xodg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778507484; x=1778593884; bh=e49LUDUI3fLq88ljRkuwcmOOBpJf
	Mk49ZZpjNJEf8Y0=; b=cq8/1Z+dWNeMx69rGrvD45teWp65sKTXuX4XhNISczWj
	Y2kS0eEI8j/WQrcjoFnIelxfLM/L+lX3lAXcyEftC8ZzohOAd8jzE+j1eukDCo07
	ocWGN3M9IKQpBn5O73IhBcVNVcrFwQLMM/6te12MLk1hXTwklJCaEIO8f1Bxf6vV
	t2RVFJutBx3g9eIoQD5ON1jg61G+EINkyKTOPgNxcktR4CXxEvWjVrtbivKllkcK
	fvCEtIjxnO7iI60vEyV+L1ywEbBbXexOV5RQ98z+SkUk6syX8FgMdL9pyg4XApAQ
	BYI1+uy93DVqRUDS+v1GpqXkoQ/4LiOehCfLwOL1tA==
X-ME-Sender: <xms:3N4BahtU3emW2HmGm1v72XBVoMWnavPGlPeUmlRTx82cc6jogRzeJw>
    <xme:3N4BagexRDglxwZuF1C4P7NtCVtPj4u1PJFZVPdTsz_06rVbnC7wiWb0_qYOceIsY
    YbJEp8Sn0vrozKQWATsjW-FMZ_1gnXYAH9NBHDKNfizZfgRgjAOv_o>
X-ME-Received: <xmr:3N4BaiagCCWFSHzb0zPoLlqgVc_QzvOpM1WzIE8tBBgpMhZyzgUEg3YfE20vKyBI1_Tlg87b7hwAeTCHw2e7jn9VB-igM2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeltdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepieetvedvtdegledttdfhheehfeeuhfdtkeetke
    fgvdeifeefhfekhfevveegtdetnecuffhomhgrihhnpehprhhotggvshhsrdhruhhnnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopehoph
    gvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdr
    ohhrgh
X-ME-Proxy: <xmx:3N4BajWdcENyBEAVWtT2m4o45hADiL-1eQiT7HjFQCBzZdgEGiTcnQ>
    <xmx:3N4BakgL07A7-dxRl0yWKvrahyrPHjPUUUWLoa0PGq7lqaT6348wOA>
    <xmx:3N4BahVp9lkbSHqN32jNp8ka6WFOrOjhu_sSzE7laEAW6IzGMhr1gQ>
    <xmx:3N4BarNORKFC4qLxAvBar62LbiD_1GsFbM8V2j-th61EGmbtLhQmvw>
    <xmx:3N4BapSX-PmZ2o1-0Z8euc96M6QlV8HUCr3XmhcQL5FQMCtadaRHF_3b>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 09:51:24 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 11 May 2026 14:51:21 +0100
Subject: [PATCH] oe/lsb: Only read /etc/os-release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-os-release-v1-1-26f53ae5e100@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIANjeAWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ND3fxi3aLUnNTE4lTd5KRUw0Qzcwsj86Q0JaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAL9kvPxuAAAA
X-Change-ID: 20260511-os-release-cbe1a67827bf
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4511; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=6GWE7scf0cE+c0VeRpB78742SMxmBDkSdQhiAAxk/V0=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQx3rutXfzoRSD3Z/bjT5M3yW9al7LVdIr4Wm+1Wc6KU
 ntX3A1Y0FHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJKM9g+Gd1QqH2fWijs2u3
 0ILil296zrxtdftiMVtZJLo6e8cphlhGhsV1db8eGZcvnZ01TzKeoSp+4b51vqpK2qWqbRcmvQ8
 8wAkA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236816

Over time, distros have standardised on providing distro name and
version information via /etc/os-release. All of our currently supported
distros contain this file, so we can drop support for gathering distro
name and version information via other methods.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/lsb.py | 90 +++---------------------------------------------------
 1 file changed, 5 insertions(+), 85 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 1fc3b968a0aa..650fb0572d0e 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -6,9 +6,8 @@
 
 def get_os_release():
     """Get all key-value pairs from /etc/os-release as a dict"""
-    from collections import OrderedDict
 
-    data = OrderedDict()
+    data = {}
     if os.path.exists('/etc/os-release'):
         with open('/etc/os-release') as f:
             for line in f:
@@ -19,95 +18,16 @@ def get_os_release():
                 data[key.strip()] = val.strip('"\'')
     return data
 
-def release_dict_osr():
-    """ Populate a dict with pertinent values from /etc/os-release """
-    data = {}
-    os_release = get_os_release()
-    if 'ID' in os_release:
-        data['DISTRIB_ID'] = os_release['ID']
-    if 'VERSION_ID' in os_release:
-        data['DISTRIB_RELEASE'] = os_release['VERSION_ID']
-
-    return data
-
-def release_dict_lsb():
-    """ Return the output of lsb_release -ir as a dictionary """
-    from subprocess import PIPE
-
-    try:
-        output, err = bb.process.run(['lsb_release', '-ir'], stderr=PIPE)
-    except bb.process.CmdError as exc:
-        return {}
-
-    lsb_map = { 'Distributor ID': 'DISTRIB_ID',
-                'Release': 'DISTRIB_RELEASE'}
-    lsb_keys = lsb_map.keys()
-
-    data = {}
-    for line in output.splitlines():
-        if line.startswith("-e"):
-            line = line[3:]
-        try:
-            key, value = line.split(":\t", 1)
-        except ValueError:
-            continue
-        if key in lsb_keys:
-            data[lsb_map[key]] = value
-
-    if len(data.keys()) != 2:
-        return None
-
-    return data
-
-def release_dict_file():
-    """ Try to gather release information manually when other methods fail """
-    data = {}
-    try:
-        if os.path.exists('/etc/lsb-release'):
-            data = {}
-            with open('/etc/lsb-release') as f:
-                for line in f:
-                    key, value = line.split("=", 1)
-                    data[key] = value.strip()
-        elif os.path.exists('/etc/redhat-release'):
-            data = {}
-            with open('/etc/redhat-release') as f:
-                distro = f.readline().strip()
-            import re
-            match = re.match(r'(.*) release (.*) \((.*)\)', distro)
-            if match:
-                data['DISTRIB_ID'] = match.group(1)
-                data['DISTRIB_RELEASE'] = match.group(2)
-        elif os.path.exists('/etc/SuSE-release'):
-            data = {}
-            data['DISTRIB_ID'] = 'SUSE LINUX'
-            with open('/etc/SuSE-release') as f:
-                for line in f:
-                    if line.startswith('VERSION = '):
-                        data['DISTRIB_RELEASE'] = line[10:].rstrip()
-                        break
-
-    except IOError:
-        return {}
-    return data
-
 def distro_identifier(adjust_hook=None):
-    """Return a distro identifier string based upon lsb_release -ri,
+    """Return a distro identifier string based upon /etc/os-release
        with optional adjustment via a hook"""
 
     import re
 
-    # Try /etc/os-release first, then the output of `lsb_release -ir` and
-    # finally fall back on parsing various release files in order to determine
-    # host distro name and version.
-    distro_data = release_dict_osr()
-    if not distro_data:
-        distro_data = release_dict_lsb()
-    if not distro_data:
-        distro_data = release_dict_file()
+    distro_data = get_os_release()
 
-    distro_id = distro_data.get('DISTRIB_ID', '')
-    release = distro_data.get('DISTRIB_RELEASE', '')
+    distro_id = distro_data.get('ID')
+    release = distro_data.get('VERSION_ID')
 
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)

---
base-commit: 4f7d1a0885d7d6f2a533f7388ed5f5a35d6f99bc
change-id: 20260511-os-release-cbe1a67827bf

Best regards,
--  
Paul Barker


