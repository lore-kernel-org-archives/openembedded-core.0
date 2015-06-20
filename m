Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 08288759DD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jun 2015 03:00:30 +0000 (UTC)
Received: by obbsn1 with SMTP id sn1so85091672obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 20:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=i4wSInCqjM6tZTPS6a29sKCHMYEihGmuKWGxy9C7cKo=;
	b=hdGbs8hwjda4/ZHs2/7H10S/BYBz45aoDftw0FGkzoou/m9GqhBZIVuycumAHI9QW8
	dWSO974oCn2t7g5/bt4SheV7ElzgODWcjaZWL1RrIK4lWp6UGUZgTuzDO/c5CGeUcF2d
	bJTM/MtTSgkp/En3AEk3FeGN+5kN5DdrFPPQ03zKNpb1Bxn1nCS50hvElqNMIzqvUtFs
	v9dWtrUv+LdI3hmMJgc+Pkvryyl+SvC25oNUBRcd5rTTHKcj5qsIu1Is9iAxGMF+aVCr
	OvrS11KSYsVkDfyhqYzaChk4WvhNajHEO0VbLKLtk3ZG6JNCCYltdMGy9F1JxMkooJTM
	YIWQ==
MIME-Version: 1.0
X-Received: by 10.60.56.97 with SMTP id z1mr16242016oep.59.1434769231556; Fri,
	19 Jun 2015 20:00:31 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Fri, 19 Jun 2015 20:00:31 -0700 (PDT)
Date: Fri, 19 Jun 2015 20:00:31 -0700
Message-ID: <CAJ86T=W1YVmDnA6PfkUDRaGsftRt8+1MhWcN2U-DFUAjzoct5g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Incomplete runtime dependencies for gdb python PACKAGECONFIG
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
X-List-Received-Date: Sat, 20 Jun 2015 03:00:34 -0000
Content-Type: text/plain; charset=UTF-8

The runtime dependencies for gdb seem to be incomplete when python
support is enabled via gdb's PACKAGECONFIG.

gdb ends up with a runtime dependency on libpython, but not on python
or any python modules, and gdb then fails to run:

  root@7401:~# gdb
  Could not find platform independent libraries <prefix>
  Could not find platform dependent libraries <exec_prefix>
  Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
  ImportError: No module named site

Manually installing python and all python modules seems to be a fix,
but I haven't narrowed down which specific python modules are
required.

The issue is a little more serious for anyone using meta-qt5, since
meta-qt5 (fido and later) contains a .bbappend for gdb which enables
the python PACKAGECONFIG by default:

  https://github.com/meta-qt5/meta-qt5/commit/9d17546d56b5e710a6420b482514202236f410e3

