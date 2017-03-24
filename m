Return-Path: <cody@arrc.ou.edu>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 44C5B77BB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:07:46 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id y88so400574ota.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrc-ou-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=E11VfJVqyy1ZeTY+wwOqCbzBolyxMj6c65rAKLvxXO4=;
	b=CDtkB4nbWX8Fx+x17LlvvGjiPys6oiL4qcVrYXG/8HeI3aW1v71FQFnZDk/xJ6Qy3f
	VURgRhCH7KRU91kiFfTTVsNSZiT3BpszMngRBeLwEa09jeHEYag6dwCCZPSVHrvvzW9Z
	BJXd5fjLzizlq49y7n9z29fZUVNBZPhFA056WfHxEMaQwqClEu9pql5cVfhfqGvACkaN
	mYp9R86/Ozn7X0V6T7yNICrus5VJmV8jsvYBOvgjdsnHAJva14i+NChBncNGOcbJLKby
	JrZbTNFpqbk6g9OmnE8VDr4V6Amo2OzKagouCOk+0m/FHGyJAhJAINUP/DsbszByZnJo
	ExPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=E11VfJVqyy1ZeTY+wwOqCbzBolyxMj6c65rAKLvxXO4=;
	b=DOxN5kUbimprAi6igOJ3emQUT3IDf6P73Pi+hxywj0JkNzxh+IC1AguZVWxMtOokMc
	pwoZIGzdA4hH+8JfQLb1KB/WItMBrFoiFjHZUDURKE5pFHJK4JQFN/MhOMxGAq1Buo5v
	mweh+O6Csm+E3KQQXsFR1I4fZNFspvNPtT2cBEbr5rHaki8Oz6C9kCnooNi0T1RQgON1
	xzzos89DRi0X6dwAl5pwWUPRzs7HOVj/AiZUIN8iKH2r+IjSON+2t3OF9eMQQImkm54H
	GFvF5HgPChJ/2GreJifK+qOZ2hE3Jja+pMKgbfnAy82wI41k1YYrlZqJV3qJ5Re+Q1H9
	u+Zg==
X-Gm-Message-State: AFeK/H1p4CsMtBHp5SxcQ8oPTTsDp7vpgU1/l00cemSyGqlUk3FCK08u8Jfm7gT0NUMPLT5ygjUjy9fng+IPKl/F
X-Received: by 10.157.7.230 with SMTP id 93mr4037324oto.223.1490364467433;
	Fri, 24 Mar 2017 07:07:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.203 with HTTP; Fri, 24 Mar 2017 07:07:47 -0700 (PDT)
From: Cody Piersall <cody@arrc.ou.edu>
Date: Fri, 24 Mar 2017 09:07:47 -0500
Message-ID: <CAKEinFxuOqEeYv1zt5oL9KpPQnN=jQ+rA3++igT7dWuWeBX=rg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Remove do_install_append() from zsh's recipe
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
X-List-Received-Date: Fri, 24 Mar 2017 14:07:47 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

The recipe for building zsh includes the following function:

do_install_append () {
    rm -fr ${D}/usr/share
}

For me, this is not a useful function because zsh store lots of nice
functionality in the "/usr/share/zsh/5.0.5/functions" directory.  This
includes things like typing cd <TAB> and autocompleting only for
directories.  I propose that this function be removed from the recipe
(patch below).  If someone needs this functionality, it would be easy
to add to their bbappend file.

Link to zsh recipe:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb?h=master

This patch removes this do_install_append:

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
index 39b2d95..d5bb1b7 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -44,10 +44,6 @@ do_configure () {
     oe_runconf
 }

-do_install_append () {
-    rm -fr ${D}/usr/share
-}
-
 pkg_postinst_${PN} () {
     touch $D${sysconfdir}/shells
     grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >>
$D${sysconfdir}/shells

This is my first post to this list, so please feel free to correct me
on any etiquette issues I've messed up.

Thanks,
Cody

