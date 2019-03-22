Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id 103DE7CFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 01:11:46 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id s7so388587iom.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=lLPB+cYQ6KSNxqR2585/ouYUTwTKtE71tEhNKzG3Jvc=;
	b=V9llxQQfSFfXPJkgOyF2oMp7gm2biE0E5ztFwAuWlJje/FqK5FcRAgqWOOyZzuYZys
	bSdy1WfF5qF8g2ZmpApq2nMSPqFa6WDiwF6SbZaB9nGx+Zscofl73CpRptnCBTLp/pu7
	LPL0j5VpmpK3TO9rpMA+BZ2nL+hirI0U6Ys9GCCuH82gxOZH/VUJkc1iMa/eYkRmCq+N
	hPJWWPIHf4spRKbBd3G6zpHcGM1AB9FsL4q/I0r3wE5f2roDmJPpVbZ2ZN1D6m4bFZXE
	TDJ15d7C+ZJnkO31NE1uCYN4SDnwlGlWj5raNJHGZ3zG6duqli0B9QK6/Vz06JC5c3Vl
	Co5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lLPB+cYQ6KSNxqR2585/ouYUTwTKtE71tEhNKzG3Jvc=;
	b=DUjYv/R0y2RRzENOqdZA2Fm4KtrwSJhX3dFAGPoQfkiVWx6jTLNfIs5BXNdVS51qL2
	ZsKl0eLU+r/WyC02ftUuW5l3TJLjwgwfYcHO3Sk+VNQucIQEOWknwmekPoTW+4/VFzmL
	/Wo4M7obisTIRoUoMncRNI5dIP0dX20tTblnS3rXECsnrQqGnNaU1f4AiRFrIb4QXzqu
	mvBGtBEiDu1ComTVmaAlz3Q8q4n/fv6CdlnxP4wQ60k/YuumB6SakS35iQRBgS7SOwBk
	QcFTwBMNr4wU63Age4SwC+MVlEng7UJyVqGv4XC1wnmMLz0g82FKzOyQ8B4UEpHLvpwo
	hrgw==
X-Gm-Message-State: APjAAAVLJfuu9dioLEQGxzdICZRQemmYq9Fat6CvIe5+TNWUxeqEEU7a
	eNBHubAr2c56VkCwA0Pez0yIQ9BlAmU4AFfpoPTjzw==
X-Google-Smtp-Source: APXvYqxc0ST5o/wEtWZz2e2sdJ7TgT9XOdF66T003+3wnWCuQCcgTnQRaLY7UQ3rCMhZnV+Cuf4kErnuKBQM2lDannY=
X-Received: by 2002:a5d:9a08:: with SMTP id s8mr4420159iol.99.1553217107040;
	Thu, 21 Mar 2019 18:11:47 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 22 Mar 2019 02:11:35 +0100
Message-ID: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: musl thoughts
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
X-List-Received-Date: Fri, 22 Mar 2019 01:11:47 -0000
Content-Type: text/plain; charset="UTF-8"

Just prepared meta-networking/networkmanager update and spent hours to
get musl patches applied. Have no idea if musl will build and
currently all my machines are building.

For me - not using musl and looking forward to have a beer with Khem
explaining me why I should want musl [1] - it is just useless effort
and patches are rejected often due to failures on musl build.

So on my way home I though about the options I see to handle musl specifics:

1. Continue as we do - patch recipe-wise: This is lots of efforts and
requires resources we don't have. Most patches are created by Khem and
it would be better for all of us to save his time for other tasks.
2. Sending musl related patches upstream: Surely the cleanest approach
but even more effort because upstream maintainers all have different
thoughts. Some of them might hear of musl for the first time and are
possibly not keen on patches they do not see a need for.
3. Change our musl slightly: Many patches we currently have are
trivial. Missing headers or #defines for missing functions... So if we
add few headers
  * Empty chunks for e.g <net/ethernet.h>
  * Add defines as #define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
  * ...

As you might guess I'd prefer 3 because:
+ Many patches can go and don't need maintenance on upstream refactoring anymore
+ Burden for people sending patches would be reduced
+ Recipes not building with musl currently might work without further
modification
+ Just in case musl stops (we have seen this before with others e.g
ulibc) the cleanup would be reduced

Of course there are disadvantages:
- We turn musl into glibc direction. Posix-purists do not like that.
- Configuration scripts already aware of musl and deciding upon the
existence of headers missing in musl might do the wrong thing
- ?

Some other ideas?

Andreas

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2018-March/193521.html

