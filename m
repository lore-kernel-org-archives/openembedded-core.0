Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web12.33742.1618238482838200436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=cDeMZD/b;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id VxkdlzrIfOQhvVxkflNG9I; Mon, 12 Apr 2021 15:41:21 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IvmFjI3g c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=3YhXtTcJ-WEA:10 a=ClgbQi6jGmcUAzLPRwcA:9 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=wCd0P5lFFewvJ18i/sdSwM2IoFwiUJhWS4T8CZXCfpM=; b=cD
	eMZD/bky4ktSQiTdyfy7GwWW97dOD0WGY7NgXzkhOs2tnUXdT9d6D15BaOZps4o/SDE25YixwfZXP
	y5RGDEiWGVFnP/BnF9UewaZFHiBErQGCCTLkYOiKJtFRBmf1g8XTAOC7SH2xSVsHyS3jayG23J8qd
	s2E/Bq/xatX4EL/3IRJ08FuRWPAI8Q9UdnwS5u1rgDMZK4S5mEZ96eNBfc2GbZEvkNA3WfqlF2QQ8
	OoWIhXwLsoh7VBc1AvXyp06LwTGyRam/N7n1SgF1ktGNWY9wcXrmjzWSlPnMWdAOJLJzwU4yX1cHC
	kQoLcSrGaTBRvHCJJ3jFZWx7UA35Aqdg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lVxkd-0006Yb-QD
	for openembedded-core@lists.openembedded.org; Mon, 12 Apr 2021 15:41:19 +0100
Date: Mon, 12 Apr 2021 15:41:19 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: archiver.bbclass and fetch2/npmsw.py
Message-ID: <20210412144119.GA18594@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfKTnduqHL/rLThrjD876Ordj3aKEJ3rlliFBHGulaRb6pRaoA37ZV6ZEVVOoL9R2vnZHDYFcgs45lhSLHsm5qeomRvcWP6/41n1g4mVpWdCHZwB6u8HJ
 7xLeidTMT3JOQWxPcteh8UaMOzgKl2D4WUjCUJVAXibChrVKQ0yUAgWAXoK12Hg8+4oD6nKmYPdfqQ==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We have a class that stores the files in ${DL_DIR} that are required for
each recipe so they can be made available in ${DL_DIR} later. This is a bit
like archiver.bbclass, but not quite the same.

I'm having trouble making our class work for recipes that use the post
refactor[1] npm.bbclass and the npmsw fetcher in Dunfell. The individual
dependency paths aren't returned by bb.fetch2.Fetch's localpaths method.

I hoped that I could see how archiver.bbclass solved this problem, so I
tried running do_ar_mirror for the recipe and got:

NOTE: Using original download: [...]/package.json
NOTE: Copying source mirror
NOTE: Archiving url: npmsw:///[...]/npm-shrinkwrap.json
NOTE: Using original download: /home/mac/src/oe/build/downloads/
NOTE: Copying source mirror
DEBUG: Python function do_ar_mirror finished

and the whole of my downloads directory ends up copied to
${WORKDIR}/archiver-sources . :(

It looks like archiver.bbclass doesn't know the dependency filenames (or
subdirectories) either because NpmShrinkWrap doesn't expose them via a
localpath method.

It didn't look like there was an easy fix for this since everyone else
expects the localpath method to return only one path. I'm hoping that I
might have missed something. Does anyone have any advice?

Thanks.

Mike.

[1] oe-core:fb2252ee0777c6d26dea94c7588c323a6b97e961
