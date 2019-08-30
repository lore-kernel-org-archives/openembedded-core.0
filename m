Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5248572EB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:08:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id d16so6842735wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LGO2efQO4CUaC5/Sf3PYJWp6GX88W/zWJ14JHSUQVmE=;
	b=Qsvj/XIG95ZWc3XbNC1LMDDDKeSnuOdmmca/15yQuEFkr+nGdMBosdQeGgq4s3VXbc
	D1k4hZyBGJQcl2jWHjNbTWQ28DucBWtWa5WCEmNbbVh1ig2B+WzmWfFqTa4Tvld7ql7e
	t4vUapHcgI4xXzypSQApdPCEn2QFhjresgJF8lFb9gf7qdSoT40uxkSfcjFx9/gs3/ys
	uBTAMXG7+QlrmsPO/gGZhro2emawdCvhAC9XsLslHZFcUqZ2O/XmcoczDDVu8GgW3vM+
	ItC0APARQFj7nvmiTfbQ3j6SHsk5muiQ5Xwn4Ucs2EtHQFbmmW5MLnaWHA7m8i5MTKYR
	2t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LGO2efQO4CUaC5/Sf3PYJWp6GX88W/zWJ14JHSUQVmE=;
	b=a7DuV7apeM3lqBdAn+n8bo5hpaG3dIEg9u7qPfDo/n5XiQZWlJZNRXj7+izLmhpEg1
	iW+Qxiwlh5eImMayPRmD6bZ2ZA5DG3eTQmUdhNIwowMjVFUlbvvgwNLFh59PgEZY11K1
	yNLHkriJmAPG+C/7Cjxn+M1bzE48yKN0hGrJ0uXwsEXLGHj6NcZE8vzhj3a283RlL9fD
	cQo0BewVn4VqGyPhOGysYaMsH2HnqSbWoKTg3YsrcPsYY3EhJDOqCI5vUzDdXfYoLkHi
	lEkwv+j9ATtqAeSyGgJ4ScNsScgJO3ZCXtoHaxRd0ctjtpd+RUBeMqCgxZlVh4l0fZdA
	f/Pg==
X-Gm-Message-State: APjAAAVEnlplpO0Hx+PeazlPslTS5FVWWxxN+nfa6bUQ4yjEAtjbCm1N
	xl/Pj4WpesrZ4jQHMo3x7v3n/PqJ5YhgC1bsdZw=
X-Google-Smtp-Source: APXvYqwzqtOL96RrqZumjBUnN7hZor4Sl/UWPMNgldfp/LrCCi4NBtb7DCPfSOcX3bkon070xFRNuKSUTnHAHaXLRGo=
X-Received: by 2002:a05:600c:40f:: with SMTP id
	q15mr17748144wmb.88.1567159726793; 
	Fri, 30 Aug 2019 03:08:46 -0700 (PDT)
MIME-Version: 1.0
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 30 Aug 2019 12:08:36 +0200
Message-ID: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
To: armccurdy@gmail.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Subject: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Fri, 30 Aug 2019 10:08:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Andre,

I've just pulled the master and experienced a build failure during
fetching of updated recipe's source tarballs.

The reason for this being that defaults for FETCHCMD has been dropped
with your patch b259bd31eb from the series. Once defaults are removed
and appends are used - the FETCHCMD gets defined to the value listed
in append, which normally does not contain a command itself rather
than necessary additional parameters (like user/passwd if working with
local pre-mirror servers).

This patch would also break several other recipes which are using
appends to FETCHCMD, for example for FETCHCMD_wget the libedit would
fail since it appends the wget to use different User-Agent.

I've copied Raj here since he introduced this recipe in the form it is
and would definitely break.

Can you please have a look at this and advise on how one can continue
to use the FETCHCMD appends for the future?

For now, I've defined the FETCHCMD_wget in my local.conf but I do not
believe that this is the general way everyone should follow if they
would need to append fetcher commands...

Thanks a lot!

-- 
Regards,
Andrey.

