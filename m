Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 293C770101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 21:28:54 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a197so337905374wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=gqHmg1Y7CJvJz984aOZ/4C2m+8ojowme6tgSeEuGCkU=;
	b=mPx7pNYbgYDUv38E4+0faL2W9bpV2R35yD1gSyi6zD+OR1hhQTBoEzqsDirBc8W2lc
	r66d6qEdA3nAslufMQYtaadWr2uEt8YgdWItcUrRaUVMS5lRjwbSFarPU8+9dOHZP4pO
	GQ42NaIBio64rFmy0QXMKgk3A6N3ENa/1LmfIvPv26ufHoGgcB1LZx/t5ouB4fa/PGAY
	C1YbAm7hJWDIiLbGV0zDejsBIPn2OSz8bFwS96Jfw+BeT06YwDcmG+VXlEEZsjN6HvaZ
	lexNDazAxhT16b98hrLRRl8fAhxg0Sx+rVh4eOEEJYczMtbST9beu/uWls6pvJg/DvwS
	iLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gqHmg1Y7CJvJz984aOZ/4C2m+8ojowme6tgSeEuGCkU=;
	b=PXlqI0ItPPrzshOGWOCfODzXGtJ0ITLyxF1T+Pl7Ct3ruKPQYwHBVXpHyVTe3gOdq/
	VntltGujZ51fiMKvfbPb9kdT7VzZixiSF2Btr1PBghGLQF96WCYVYiYG/qp9r2aCd30m
	KG3ozPqKbS+9LxGe5I/wbQnYl/DaAHkiX/0oSBeQVZOcg7gf9JlU8N37KEUrdMXgyvr4
	jJN+fsMdUYfGhR5vGstDmuC1St99HoDJKyJ+NKJKv2THs73Nal8w0jP71KCNVbN1ub8P
	ahHGqJdDS6jrmQlODTQpcKXuhcc4Otj4+Yh55rbo19odACQL39Dgij3OAn9kn2hecbP4
	B/3A==
X-Gm-Message-State: AKaTC03VgUr/HtQqUS50wdBZlv9hmMpD47QuxZ5kA3mg69e+y9ZoVCuiJudiDm59fi7uv67QyVs0ZK48mfbm/Q==
X-Received: by 10.194.112.170 with SMTP id ir10mr3379089wjb.190.1479418135301; 
	Thu, 17 Nov 2016 13:28:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Thu, 17 Nov 2016 13:28:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 17 Nov 2016 13:28:54 -0800
Message-ID: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Modifying SRC_URI from anonymous python
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
X-List-Received-Date: Thu, 17 Nov 2016 21:28:59 -0000
Content-Type: text/plain; charset=UTF-8

I have a supplier who provides recipes which set SRC_URI to their
private git servers. To make those same recipes usable by others (ie
me), some anonymous python is used to transform the default SRC_URI
(elements which contain private git URLs are replaced, patches and
other files are left as-is).

This apparently worked in OE 2.0 but from 2.1 onwards the anonymous
python which modifies SRC_URI races with the anonymous python in
base.bbclass which parses SRC_URI to determine additional
do_fetch/do_unpack dependencies and whether or not to call
fetch2.get_srcrev(). Specifically I get failures because
fetch2.get_srcrev() sees the original SRC_URI and tries to resolve
AUTOREV from a repo to which I don't have access.

The proposed solution from the supplier is this patch to base.bbclass:

@@ -598,7 +598,7 @@ python () {
             d.appendVarFlag('do_unpack', 'depends', '
file-native:do_populate_sysroot')

     if needsrcrev:
-        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
+        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}", parsing=True)

     set_packagetriplet(d)

After reading the setVar source I'm not very clear how or why this
works, but it looks dubious. What is parsing=True intended to do?

Is it documented somewhere that modifying SRC_URI from anonymous
python isn't allowed? I've now seen two suppliers both independently
run into the same problem when updating to OE 2.1.

