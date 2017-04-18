Return-Path: <michael.thalmeier@hale.at>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Apr 2017 08:10:32 UTC
Received: from gw.hale.at (gw.hale.at [89.26.116.210])
	by mail.openembedded.org (Postfix) with ESMTP id 647A16067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:10:32 +0000 (UTC)
X-HALE-Mailborder-Watermark: 1493107442.96972@pHzQgiVxfvkqW3VdVo61FQ
X-HALE-Mailborder-From: michael.thalmeier@hale.at
X-HALE-Mailborder-SpamCheck: not spam,
	SpamAssassin (nicht zwischen gespeichert, Wertung=-2.898,
	benoetigt 3, autolearn=not spam, ALL_TRUSTED -1.00, BAYES_00 -1.90,
	SURBL_BLOCKED 0.00, URIBL_BLOCKED 0.00)
X-HALE-Mailborder-IP-Protocol: IPv4
X-HALE-Mailborder: Found to be clean
X-HALE-Mailborder-ID: 230552C3563.A5F55
X-HALE-Mailborder-Information: Please contact your admin for more information
Received: from mail.hale (mail.hale [192.168.100.5])
	by gw.hale.at (Postfix) with ESMTP id 230552C3563;
	Tue, 18 Apr 2017 10:04:02 +0200 (CEST)
Received: from mail.hale (localhost.localdomain [127.0.0.1])
	by mail.hale (Postfix) with ESMTP id 19A82667177;
	Tue, 18 Apr 2017 10:04:02 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.hale (Postfix) with ESMTP id 0E58F66632A;
	Tue, 18 Apr 2017 10:04:02 +0200 (CEST)
Received: from mail.hale ([127.0.0.1])
	by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FA-ChpojL7QJ; Tue, 18 Apr 2017 10:04:02 +0200 (CEST)
Received: from entw49.hale (entw49.hale [192.168.100.117])
	by mail.hale (Postfix) with ESMTPSA id F051366042C;
	Tue, 18 Apr 2017 10:04:01 +0200 (CEST)
From: Michael Thalmeier <michael.thalmeier@hale.at>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <861a3584-1fc0-11a2-35e8-7ca81d2e25b2@hale.at>
Date: Tue, 18 Apr 2017 10:03:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: kernel.bbclass auto PR generation
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
X-List-Received-Date: Tue, 18 Apr 2017 08:10:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

In our build environment we have a buildbot building nightly
clean builds of our images and a PRSERV instance managing the
auto PR generation.

With this setup we encountered the problem, that on each build
the kernel PR is incremented by 3, even if nothing has changed,
so the PR should be equal to the last value.

After investigating I found that currently the kernel bbclass
will call package_get_auto_pr three times (do_package, do_install,
do_deploy). As the package_get_auto_pr function uses the BB_TASKHASH
variable, that is different for each of these tasks,
on each call the PR is incremented by 1.

This has two different effects:
1. The kernel and modules image in the deploy directory do not
   have the same PR as the kernel package itself.
2. Each time a clean build of the kernel is performed, the PR
   is incremented by three instead of staying at the previous value.

I found that this was introduced with commit:
1392f95 kernel.bbclass: Ensure we have correct version information in dep=
loy data

How can this behaviour be fixed?

Best regards,
Michael
--=20

Michael Thalmeier
(Development)
HALE electronic GmbH
Eugen-M=C3=BCller-Stra=C3=9Fe 18, 5020 Salzburg, Austria
Tel: +43 (662) 439011 0
Fax: +43 (662) 439011 9
michael.thalmeier@hale.at
Firmenbuchnummer: FN 66801m HG Salzburg

