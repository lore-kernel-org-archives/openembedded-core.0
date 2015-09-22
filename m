Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 537A97391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 23:01:07 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so16825858vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=jSwepc8+anHukFuT5GfNAtZ2/TYNkXW5MBAhPiocz6c=;
	b=pc0NRMFYiEdgamscvwHtQBjHptbXisiebJ3T7WJKwDAV18hpxR7enoRrh7IcVEVydf
	1mdb4z3rK6ARV9kdoo7cnJvArF1zyaKyRtARFCyL0rjKFIry0cGXnkXJ5GXNIHsBn4up
	TRcvSkyuvJVJYoMutxfimYQfTmCV6d0ISgb5NP9GRqrPG+I07fGWLOJa/sdmemF2YDI+
	t68LOM/jWQ8CVaUdZ/8DMqSkoLMcy4Z+o3QO8sb9Gu07AazIBEe8K7C5VNMW0OEim9DO
	tH8h45dZeB5URQP1pMzoz0Pn/jPi5V+WcJo/xu1Z0/rbhyfuIvQ0pNSO/p2t/H7xqbVA
	fXUQ==
X-Received: by 10.31.180.79 with SMTP id d76mr17324445vkf.111.1442962867022;
	Tue, 22 Sep 2015 16:01:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Tue, 22 Sep 2015 16:00:47 -0700 (PDT)
In-Reply-To: <40d0326d6ea38f66b3dae92052df84111bb35763.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
	<40d0326d6ea38f66b3dae92052df84111bb35763.1442934838.git.paul.eggleton@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 22 Sep 2015 16:00:47 -0700
X-Google-Sender-Auth: KBPU9RG88z3tN5rPmfA5e-5Puhg
Message-ID: <CABcZANkhQnYQ2GzKxu9nMA8mk8TpAMmMFV-w-szi0MnN=JH+tQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/27] lib/oe/recipeutils: properly split unexpanded variable values
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
X-List-Received-Date: Tue, 22 Sep 2015 23:01:14 -0000
Content-Type: multipart/alternative; boundary=001a11438ade1cf09205205df99c

--001a11438ade1cf09205205df99c
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2015 at 9:21 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Variables such as SRC_URI which are space-separated may also contain
> Python expressions (${@...}) which themselves contain spaces that
> shouldn't be split when splitting the value into items. In order to
> ensure this we need to use a custom splitting function instead of just
> string.split().
>
> This issue could be seen when doing "devtool modify sudo", adding a
> commit to the resulting source repository then "devtool update-recipe" -
> the Python expression in SRC_URI was being unnecessarily broken onto
> multiple lines.
>
> Fixes [YOCTO #8046].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>

This is interesting, I recently had a need for a split like that too. I had
written a prototype class which automatically disables all packageconfigs
which introduce optional dependencies, to see how much it would reduce the
dependencies, and wanted to ignore bits dependent on DISTRO_FEATURES, so
wanted to ignore all inline python.
https://gist.github.com/kergoth/2c556d9e34cbcd03cb82#file-packageconfig-backdel-bbclass-L107-L122
is my version of it. Possibly overly complex, since my version produces an
extremely lightweight parse tree (list-based) for nested references, and
then has to flatten it back out. I found it interesting that we both had a
need for this sort of functionality -- perhaps a split function along these
lines would be of use in one of the oe python package modules.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11438ade1cf09205205df99c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Sep 22, 2015 at 9:21 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":s5" c=
lass=3D"" style=3D"overflow:hidden">Variables such as SRC_URI which are spa=
ce-separated may also contain<br>
Python expressions (${@...}) which themselves contain spaces that<br>
shouldn&#39;t be split when splitting the value into items. In order to<br>
ensure this we need to use a custom splitting function instead of just<br>
string.split().<br>
<br>
This issue could be seen when doing &quot;devtool modify sudo&quot;, adding=
 a<br>
commit to the resulting source repository then &quot;devtool update-recipe&=
quot; -<br>
the Python expression in SRC_URI was being unnecessarily broken onto<br>
multiple lines.<br>
<br>
Fixes [YOCTO #8046].<br>
<br>
Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a>&gt;</div></blockquote></div><br>Th=
is is interesting, I recently had a need for a split like that too. I had w=
ritten a prototype class which automatically disables all packageconfigs wh=
ich introduce optional dependencies, to see how much it would reduce the de=
pendencies, and wanted to ignore bits dependent on DISTRO_FEATURES, so want=
ed to ignore all inline python.=C2=A0<a href=3D"https://gist.github.com/ker=
goth/2c556d9e34cbcd03cb82#file-packageconfig-backdel-bbclass-L107-L122">htt=
ps://gist.github.com/kergoth/2c556d9e34cbcd03cb82#file-packageconfig-backde=
l-bbclass-L107-L122</a> is my version of it. Possibly overly complex, since=
 my version produces an extremely lightweight parse tree (list-based) for n=
ested references, and then has to flatten it back out. I found it interesti=
ng that we both had a need for this sort of functionality -- perhaps a spli=
t function along these lines would be of use in one of the oe python packag=
e modules.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>c=
larson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br=
>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11438ade1cf09205205df99c--
