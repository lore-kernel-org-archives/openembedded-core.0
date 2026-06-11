Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF10CD8CB9
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 06:12:58 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39381.1781158376103585823
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 23:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=NJL3ycT7;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=NJL3ycT7;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781158373;
	bh=IfuXWylWn80EQeyrPxTdGVv0HLNO4fvxWfF8ScOqWoA=;
	h=From:To:Subject:Date:From;
	b=NJL3ycT7pA9jTvir+HFPNNF4sHF9UfF6uVOqC/gWb0LVw/j924xD81aHOw/slZxLj
	 i9oOoskVRm4oNEpCGQNz+lCi378TjGiIMrbMT37IdUvmyQXuMwHHAgdFP0M+tThaDL
	 Xmt6ykbh1FhMskntU0INUXTZSpfuOCM9e6aKGqikg5o0WXbS89/SgSYaaFWbJ+VjlF
	 CJ4Ni7o2pxg6mBYn8z7sRBJ8a5qY2rE2sdzwD/J25HkGLKOvBSa2jfmsD7C/KIRUmy
	 /yF2e6clfPpgkyAsukOCwSKlCnztnZUGeANIYCmJHPZDtdGJDH+4ILlabKZFJz4GPm
	 ItkK4SOk5dVIw==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id E575E5F9A8
	for <Openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781158373;
	bh=IfuXWylWn80EQeyrPxTdGVv0HLNO4fvxWfF8ScOqWoA=;
	h=From:To:Subject:Date:From;
	b=NJL3ycT7pA9jTvir+HFPNNF4sHF9UfF6uVOqC/gWb0LVw/j924xD81aHOw/slZxLj
	 i9oOoskVRm4oNEpCGQNz+lCi378TjGiIMrbMT37IdUvmyQXuMwHHAgdFP0M+tThaDL
	 Xmt6ykbh1FhMskntU0INUXTZSpfuOCM9e6aKGqikg5o0WXbS89/SgSYaaFWbJ+VjlF
	 CJ4Ni7o2pxg6mBYn8z7sRBJ8a5qY2rE2sdzwD/J25HkGLKOvBSa2jfmsD7C/KIRUmy
	 /yF2e6clfPpgkyAsukOCwSKlCnztnZUGeANIYCmJHPZDtdGJDH+4ILlabKZFJz4GPm
	 ItkK4SOk5dVIw==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id CC5B65F8C1
	for <Openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:12:53 +0200 (CEST)
From: Andreas =?UTF-8?B?TcO8dHplbA==?= <andreas.muetzel@emlix.com>
To: Openembedded-core@lists.openembedded.org
Subject: [wrynose] overlayfs.bbclass: upperdir ownership change in wrynose
Date: Thu, 11 Jun 2026 08:12:52 +0200
Message-ID: <14026682.uLZWGnKmhe@mobilepool081.emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 06:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238422

Hi all,

we observed a change in the behaviour of overlayfs.bbclass when porting a B=
SP=20
from scarthgap to wrynose:

This class used to create a helper unit that created the upperdir if it did=
=20
not exist by calling the script found in meta/files/overlayfs-create-dirs.s=
h.=20
Additionally, the script changed the owner of the upperdir to match the one=
 of=20
the lowerdir.

This helper unit and script been removed in oe-core with commit=20
623c20ff1e989730138c3fbe6e8247eaada20707 because systemd now automatically=
=20
creates the upperdir if it does not exist. But systemd does not adapt the=20
ownership; instead, it gets created as owned by the default user and group=
=20
(root:root).

I could not find any reference to this change in the migration notes - is t=
his=20
an intentional change or have we discovered a regression?

Best regards,
Andreas

=2D-=20
emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
Office M=C3=BCnchen: Am Knie 16, 81241 M=C3=BCnchen, Germany
http://www.emlix.com

emlix - your embedded Linux partner



