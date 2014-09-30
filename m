Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A357871648
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:47:19 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rl12so6876549iec.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=m8F5Tg5duxbw3/6Ucx4jV3NaWIm9cCaT1xqP4xa8j6U=;
	b=dqkDhpDykebXz48xA5/v/7rMoVg5qvS0T6k3dlgjLCJIk1IoWySWPfARuwCzKqsMIz
	yPK+PQeKumQLhq15DFFPr1dQnhI0so8GQugJPmIeX96hMVscDQDhq5NpWnvrUZ+tUL+8
	n11pIbmK6SwBacdV2TCsKbWVqLD0sZb4v3hb7bX0gmx77ejvWj6OLoYixXtjxAHZLGE+
	mC8+T4qeyBTKcOOlmCfkE0vOe4lxhH+NfUAnkbfxRXcZQoir10iUtInwgEztwYbdPqqK
	YLlGSzyeHrNAnM6lEoX9dOa77h6VFsBn5stF8qC1jPSvmG8Fg0Al60j0r7OChZ3OZMdH
	BlhA==
X-Received: by 10.50.138.134 with SMTP id qq6mr9716895igb.0.1412092039796;
	Tue, 30 Sep 2014 08:47:19 -0700 (PDT)
Received: from localhost.localdomain (75-163-154-89.clsp.qwest.net.
	[75.163.154.89]) by mx.google.com with ESMTPSA id
	hg4sm13331857igb.15.2014.09.30.08.47.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Sep 2014 08:47:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 08:47:14 -0700
Message-Id: <1412092036-30364-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] Update timezone recipes to 2014h
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
X-List-Received-Date: Tue, 30 Sep 2014 15:47:23 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

if this has been already submitted, ignore.

These are the following changes:

Changes affecting past time stamps

    America/Jamaica's 1974 spring-forward transition was Jan. 6, not Apr. 28.

    Shanks says Asia/Novokuznetsk switched from LMT (not "NMT") on 1924-05-01,
    not 1920-01-06.  The old entry was based on a misinterpretation of Shanks.

    Some more zones have been turned into links, when they differed
    from existing zones only for older time stamps.  As usual,
    these changes affect UTC offsets in pre-1970 time stamps only.
    Their old contents have been moved to the 'backzone' file.
    The affected zones are: Africa/Blantyre, Africa/Bujumbura,
    Africa/Gaborone, Africa/Harare, Africa/Kigali, Africa/Lubumbashi,
    Africa/Lusaka, Africa/Maseru, and Africa/Mbabane.

Changes affecting code
    zdump -V and -v now output gmtoff= values on all platforms,
    not merely on platforms defining TM_GMTOFF.  
    
    The tz library's localtime and mktime functions now set tzname to a value
    appropriate for the requested time stamp, and zdump now uses this
    on platforms not defining TM_ZONE, fixing a 2014g regression.
    (Thanks to Tim Parenti for reporting the problem.)

    The tz library no longer sets tzname if localtime or mktime fails.
    zdump -c no longer mishandles transitions near year boundaries.
    (Thanks to Tim Parenti for reporting the problem.)

    An access to uninitalized data has been fixed.
    (Thanks to Jörg Richter for reporting the problem.)

    When THREAD_SAFE is defined, the code ports to the C11 memory model.
    A memory leak has been fixed if ALL_STATE and THREAD_SAFE are defined
    and two threads race to initialize data used by gmtime-like functions.
    (Thanks to Andy Heninger for reporting the problems.)

Changes affecting build procedure 
    'make check' now checks better for properly-sorted data.

Changes affecting documentation and commentary
    zdump's gmtoff=N output is now documented, and its isdst=D output
    is now documented to possibly output D values other than 0 or 1.

    zdump -c's treatment of years is now documented to use the
    Gregorian calendar and Universal Time without leap seconds,
    and its behavior at cutoff boundaries is now documented better.
    (Thanks to Arthur David Olson and Tim Parenti for reporting the problems.)

    Programs are now documented to use the proleptic Gregorian calendar.
    (Thanks to Alan Barrett for the suggestion.)

    Fractional-second GMT offsets have been documented for civil time
    in 19th-century Chennai, Jakarta, and New York.

Armin Kuster (2):
  tzcode-native: update to 2014h
  tzdata: update to 2014h

 meta/recipes-extended/tzcode/tzcode-native_2014g.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014h.bb | 11 +++++++++++
 meta/recipes-extended/tzdata/tzdata_2014g.bb        |  6 ------
 meta/recipes-extended/tzdata/tzdata_2014h.bb        |  6 ++++++
 4 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014g.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014g.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb

-- 
1.9.1


