Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 45322784F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 20:15:45 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id i143so3488669ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jan 2018 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:mime-version
	:content-transfer-encoding;
	bh=b8FfF1zVXtWkQNXUpxbrNXMFzeYHwJYrTeJZ9twX0yo=;
	b=TNx0lGleqdgy+Mjv1LuFXvVMJJdEJpds59HEaJ9ntn8GTWJd23SUHsx1vnklJBNEEJ
	rdQhBhcAkgQihP+GqBkcPdwoVcr3J9Nd0KbngPBTH2Uy0rXwgi3HiJ2otdcUXZtfW0aA
	M4PqfOHZK5ilI7TVVZiTIz4ypvgnaOkfdhqau6jW938xVyI6uW4Cpvs2XX9LadKknMCp
	h2L5GkEBscyxxjBZKCWO97YwyBxD1Lo8QQQyatfG/Jys/Z1QmYLPzQWMvW4cPhV+pZva
	IUDAedlQaSKLJHoFbE2aVzgXVEpg3hj6309lSDL9FiGCLZKH08WVZNs7XyV7nVT901RI
	7Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:mime-version
	:content-transfer-encoding;
	bh=b8FfF1zVXtWkQNXUpxbrNXMFzeYHwJYrTeJZ9twX0yo=;
	b=K61GShxMJjgKGInInDd25Wri+ijde3hHhg8t8zJTS8TRFH8wkQbS68PIlstBhYPh0B
	0GhfmD0Nhk7bh1K5/VjXGghj1W1A/XbLMM5g2u4T69fDe23/JDpoC3WzzdbUNYwFu/OD
	u9qEFxgy4l94x8zVQzYDFiwX5sm+JKIuneIg1p5HTQfIA00BFapdvek1vhJuQQEdPCWM
	WqypMG9enjB2Up9z4vcRuP9WQnKCIJmVppw9gl3/izt8/rei8qElFphcUWNDXwSpCdOJ
	3zUo3nwwBmPXEzGVQds5ke4Yz35NWXX9GYX73MFsULu8KlpWOt+m/xSWVHyGs10Z5DBQ
	T7dQ==
X-Gm-Message-State: AKwxytcpK9LBevVD+NCUj9m5TA4T54LIK9qKMh5awo3gDAZ+yb44HEVE
	RWWS7eFjUP0uPqDle8K3rq63VCpp
X-Google-Smtp-Source: ACJfBouequG6/eVZgx5SFW+2vc9XvbIxx1jv87p1jW+aBVnqOfzU3G763858d0lB3gmMumAPN26Zrw==
X-Received: by 10.107.69.7 with SMTP id s7mr808308ioa.282.1515096947194;
	Thu, 04 Jan 2018 12:15:47 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	h94sm2458783iod.40.2018.01.04.12.15.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Jan 2018 12:15:42 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1515096936.665.19.camel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 04 Jan 2018 14:15:36 -0600
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Subject: Uninative and sstate
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
X-List-Received-Date: Thu, 04 Jan 2018 20:15:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've run into a strange issued that turned out to be cased by missing
iconv conversion libraries in our uninative tarball, but is sparked a
larger question that I was hoping someone here could answer.

The problem was particularly baffling. We were attempting to use
Doxygen in a recipe which required some missing iconv conversion files.
If we built doxygen locally, it worked just fine, but if we choose to
allow bitbake to pull doxygen down from a sstate it would fail. Even
more baffling, if we manually extracted the sstate do_populate_sysroot
tarball for doxygen and used the executable there, everything worked.
We surmised that bitbake was modifying the the doxygen executable after
it extracted from the sstate tarball, which was confirmed by comparing
checksums. After some digging, the cause of the change was tracked down
to uninative_changeinterp() running after the sstate tarball was
extracted, changing the program interpreter to the one in the uninative
tarball.

My question is: Why is this coercion of the program interpreter *only*
done when the sysroot is populate from sstate? For consistency, it
would seem appropriate to also coerce the interpreter when doing
do_populate_sysroot from an actual build. If this had been done, we
would have noticed the missing library when building locally, and the
sstate cache would not have caused "random" build breakage.

Does anyone have any insight as to why this isn't done?

Thanks,
Joshua Watt



