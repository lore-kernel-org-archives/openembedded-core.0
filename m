Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61492E7FDCB
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:54:51 +0000 (UTC)
Subject: Re: [PATCH v6 2/4] cvelistv5: add a new recipe
To: openembedded-core@lists.openembedded.org
From: "vboudevin" <valentin.boudevin@gmail.com>
X-Originating-Location: Laval, Quebec, CA (208.88.110.46)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 11:54:41 -0800
References: <188AFCD98EA3E578.3200434@lists.openembedded.org> <20260129211012.623827-1-valentin.boudevin@gmail.com> <20260129211012.623827-3-valentin.boudevin@gmail.com> <49de779cc2db0ef5c2bade9c8b07e076dedc340f.camel@linuxfoundation.org> <442096.1770040131832557569@lists.openembedded.org> <CAApg2=Q10Dbk2kJ1k0ZLp3sw2wsw9pqxBeOcMQPP9tVr6dkoig@mail.gmail.com>
In-Reply-To: <CAApg2=Q10Dbk2kJ1k0ZLp3sw2wsw9pqxBeOcMQPP9tVr6dkoig@mail.gmail.com>
Message-ID: <1043486.1770062081174158975@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="naSVx5Vt2KL8vlxiXJKb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 19:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230397

--naSVx5Vt2KL8vlxiXJKb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Martha,

Thanks for the feedback.

As I understand, you are referring to CVE_DB_UPDATE_INTERVAL, which can be =
set to a negative value to disable the download.

I have already tried using a custom "do_fetch" task with a git fetch/pull a=
ttempt, as well as with a fixed commit reference in failing scenarios.
But, it seems that I can't avoid a parsing issue if the SRCREV is set to ${=
AUTOREV} with the build machine not connected to any network (due to a fail=
ed attempt to resolve the latest commit hash).

A new .bbclass seems appropriate (e.g., non_deterministic_native.bbclass) t=
o handle natives recipes that require an up-to-date git database.
Adding a non-deterministic class to fetch the latest available commit seems=
 a necessary tool for CVE, as you always want to look at the latest availab=
le information (e.g., I have a PR also open for improve_kernel_cve, which h=
as the same issue).

This class could be used to redefine fetch and unpack mechanisms provided b=
y the "base" class, as you did with cve-update-nvd2-native.
It would take a default commit as a reference (e.g., "644ce1758db1773336ebe=
bb6a0da90e132da0eb7"), which won't break the build without any network. In =
addition, the new do_fetch task would try at the same time to pull the late=
st available commit if any network is available.

But I don't think I want to handle this mechanism in my current PR. It may =
be preferable to keep it in a future dedicated one. I would prefer to have =
my boilerplate merge first with a fixed SRCREV.

--naSVx5Vt2KL8vlxiXJKb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Martha,&nbsp;<br />&nbsp;<br />Thanks for the feedback.<br />&nb=
sp;<br />As I understand, you are referring to CVE_DB_UPDATE_INTERVAL, whic=
h can be set to a negative value to disable the download.&nbsp;<br /><br />=
I have already tried using a custom "do_fetch" task with a git fetch/pull a=
ttempt, as well as with a fixed commit reference in failing scenarios.<br /=
>But, it seems that I can't avoid a parsing issue if the SRCREV is set to $=
{AUTOREV} with the build machine not connected to any network (due to a fai=
led attempt to resolve the latest commit hash).<br /><br />A new .bbclass s=
eems appropriate (e.g., non_deterministic_native.bbclass) to handle natives=
 recipes that require an up-to-date git database.</div>
<div>Adding a non-deterministic class to fetch the latest available commit =
seems a necessary tool for CVE, as you always want to look at the latest av=
ailable information (e.g., I have a PR also open for improve_kernel_cve, wh=
ich has the same issue).</div>
<div>&nbsp;</div>
<div>This class could be used to redefine fetch and unpack mechanisms provi=
ded by the "base" class, as you did with cve-update-nvd2-native.<br />It wo=
uld take a default commit as a reference (e.g., "644ce1758db1773336ebebb6a0=
da90e132da0eb7"), which won't break the build without any network. In addit=
ion, the new do_fetch task would try at the same time to pull the latest av=
ailable commit if any network is available.<br /><br />But I don't think I =
want to handle this mechanism in my current PR. It may be preferable to kee=
p it in a future dedicated one. I would prefer to have my boilerplate merge=
 first with a fixed SRCREV.</div>

--naSVx5Vt2KL8vlxiXJKb--

