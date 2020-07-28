Received: from mailout12.rmx.de (mailout12.rmx.de [94.199.88.78])
 by mx.groups.io with SMTP id smtpd.web11.11299.1595940966534651708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 05:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.78, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout12.rmx.de (Postfix) with ESMTPS id 4BGGrK02bNzRnbr
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 14:56:01 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4BGGrD2bjQz2TTLW
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 14:55:56 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.29) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 28 Jul
 2020 14:55:56 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: archiver.bbclass and GIT repositories
Date: Tue, 28 Jul 2020 14:55:55 +0200
Message-ID: <3040885.oeqThZ24Ku@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.29]
X-RMX-ID: 20200728-145556-4BGGrD2bjQz2TTLW-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In my project, the linux kernel (together with dozens of our changes) is ke=
pt
in a company internal GIT repository. The GPLv2 requires the following:

> 2a) You must cause the modified files to carry prominent notices stating
> that you changed the files and the date of any change.

My idea is, that the GIT history (and diff) should be sufficient for docume=
nting
our changes to the linux source code.

But when I unpack the .tar.gz file which was deploy by archiver.bbclass,
I get the following:

# tar -xf my-linux-kernel.tar.gz
# cd <temporary directory name>/git
# git log

> error: object directory /srv/gitlab-runner/downloads/[..]/yocto/git2/[xxx=
].git/objects does not exist; check .git/objects/info/alternates
> fatal: bad object HEAD

Note: The project has been built on another machine.

From the bitbake user manual, 4.3.5, Git Fetcher:
> "This bare clone is then cloned into the work directory during the unpack
> stage when a specific tree is checked out. This is done using alternates =
and
> by reference to minimize the amount of duplicate data on the disk and mak=
e
> the unpack process fast."

It looks like the .git directory within the tar archive doesn't contain
the necessary information required for using the "git" command on
the extracted "working copy". If I understood the bitbake doc correctly,
the working copy is cloned "by reference" from a "bare" clone which
resided outside the archived directory (in the downloads dir).

So I have three questions:
1. Is it possible to archive the git project in a way, that the GIT history
can be examined later?
2. If this is not possible, I would have to put my changes in an
"external" patch file alongside the bitbake recipe, right?
3. Is there any value archiving the .git directory at all?

regards
Christian



________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler
