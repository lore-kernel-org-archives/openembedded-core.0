Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web10.9252.1590135486227756882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 01:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=QUNZs00H;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb ([80.229.24.9])
	by smtp with ESMTP
	id c2oajHxhnjUVQc2objl6lY; Fri, 22 May 2020 09:14:04 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=L5aGv9b8 c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=sTwFKg_x9MkA:10 a=Nxevoe6scR6WklUdKekA:9 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=QimrEseTk3HkiVzpZuP9o9EIBNEXSTkXplhCspUfBPs=; b=QU
	NZs00H3zJqU3TNvG1fDjGJ4seuGWvDdeBVG/abcVWNiEDrckBb96Q/kQZjxw7CCFjnwwJpacR1lRZ
	TJiMUKfV9aRlF89wLOiAyxgMj55w0mBF/r/1NkIwqr1XQBX+Pt5zyhnyVQa1495nQ4TlzmSXetYGA
	vsjX4HcOU9RMI4VX7YMW/BLY3CaOA8YKKcJp3kJYFmopQrB0nPmccN31Suy+mMFtg8QBKs762az3E
	50K0kCQTW9raA8897V49ZlSvehSMD/gnzYaFsfA1bz6CmBO9IhSN+7fHvBUPOtTBFGvifwbzylB5K
	7mhftByJuUrVAaBN9YlaM4D7z3+XWHSw==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1jc2oZ-0004vA-Vd
	for openembedded-core@lists.openembedded.org; Fri, 22 May 2020 09:13:59 +0100
Date: Fri, 22 May 2020 09:13:59 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: rm_work causes image tasks to re-run
Message-ID: <20200522081359.GA1428@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfONKC7JQPvg9eG4h/JX8otlZ79I0Qc5gnkRz1WXecZKlIwWD3bqLopVc2OiGmhBv6WpkNcB7RWTLzOHnodKZ0aeRkEjquS1WhgL1HXFE2JimomkVgvZZ
 3guXNKED6ELJAT9vj37pfQ2bvZrLYGslyIegVu8RhVs3RJ9Wg0jjaDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When we have rm_work enabled all image tasks are built every time. This has
been happening since at least warrior and is still happening as of master
today (8fc19639f47b959a141dae231395bbababa644e1).

Steps to reproduce:

 bitbake core-image-minimal
 bitbake core-image-minimal
 echo 'INHERIT += "rm_work"' >> conf/local.conf
 bitbake core-image-minimal
 bitbake core-image-minimal

The second invocation of bitbake doesn't build anything at all (as would be
expected.)

The fourth invocation of bitbake always builds:

 Sstate summary: Wanted 43 Found 43 Missed 0 Current 436 (100% match, 100% complete)
 NOTE: Executing Tasks
 NOTE: Setscene tasks completed
 NOTE: Running noexec task 1750 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_rm_work_all)
 NOTE: Running task 1998 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_populate_lic_deploy)
 NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic_deploy: Started
 NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic_deploy: Succeeded
 NOTE: Running task 1999 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_rm_work)
 NOTE: recipe core-image-minimal-1.0-r0: task do_rm_work: Started
 NOTE: recipe core-image-minimal-1.0-r0: task do_rm_work: Succeeded
 NOTE: Running noexec task 2000 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_build)
 NOTE: Tasks Summary: Attempted 2000 tasks of which 1996 didn't need to be rerun and all succeeded.

If I teach rm_work.bbclass to also skip files matching
"*do_populate_lic_deploy*" then this problem goes away. However, I have
form for breaking things in rm_work so I suspect that this isn't the
correct fix. Is there a better one?

Thanks.

Mike.
