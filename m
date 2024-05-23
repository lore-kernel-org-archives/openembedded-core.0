Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DE0C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 15:24:17 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Rinchoa, Lisbon, PT (78.137.195.161)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 May 2024 08:24:12 -0700
References: <CANNYZj-d-SSYPv-wZF8kfnSvt7i-cG3ec3wotSNETD6-OttyKQ@mail.gmail.com>
In-Reply-To: <CANNYZj-d-SSYPv-wZF8kfnSvt7i-cG3ec3wotSNETD6-OttyKQ@mail.gmail.com>
Message-ID: <30216.1716477852755796076@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="akxMZs7ncGoLsDUxtlEW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 15:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199810

--akxMZs7ncGoLsDUxtlEW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

So problem starts at sstate.bbclass:406 (sstate_install(ss, d)), this shoul=
d be running after the next for loop (for plain in ss['plaindirs']:).

Having this fixed, jumping to the buildhistory.bbclass:602, find should be =
out of the loop to give an hard error if it misses.
Then inside the for loop, while checking if output folder exists (buildhist=
ory.bbclass:607), this doesnt make sense to me the way it is running:
- the comment refers "Make sure the output folder exists...", but we are no=
t creating it if we need, just skipping if doesnt exists.
- this folder is being created on do_packagedata (buildhistory.bbclass:396)=
 to write down latest file.

So before spending more time on this topic i have a few questions to unders=
tand a little bit of what should be the strategy to fix this:

- If we want to keep files-in-package.txt being created on do_package, shou=
ldnt `buildhistory_list_pkg_files()` (buildhistory.bbclass:600) be responsi=
ble to create the folder on buildhistory side?
- If we keep `buildhistory_list_pkg_files` being triggered by do_package is=
 there any case of do_package_setscene trigger this? I couldnt find any cas=
e to support this option (buildhistory.bbclass:101).
- If not we dont need in fact to create files-in-package.txt on do_package,=
 should files-in-package.txt creation be moved to do_packagedata?

Thanks,

Pedro

--akxMZs7ncGoLsDUxtlEW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,<br /><br />So problem starts at sstate.bbclass:406 (sstate_install=
(ss, d)), this should be running after the next for loop (for plain in ss['=
plaindirs']:).<br /><br />Having this fixed, jumping to the buildhistory.bb=
class:602, find should be out of the loop to give an hard error if it misse=
s.<br />Then inside the for loop, while checking if output folder exists (b=
uildhistory.bbclass:607), this doesnt make sense to me the way it is runnin=
g:<br />&nbsp;- the comment refers "Make sure the output folder exists...",=
 but we are not creating it if we need, just skipping if doesnt exists.<br =
/>&nbsp;- this folder is being created on do_packagedata (buildhistory.bbcl=
ass:396) to write down latest file.<br />&nbsp;<br />So before spending mor=
e time on this topic i have a few questions to understand a little bit of w=
hat should be the strategy to fix this:<br /><br />- If we want to keep fil=
es-in-package.txt being created on do_package, shouldnt `buildhistory_list_=
pkg_files()` (buildhistory.bbclass:600) be responsible to create the folder=
 on buildhistory side?<br />- If we keep `buildhistory_list_pkg_files` bein=
g triggered by do_package is there any case of do_package_setscene trigger =
this? I couldnt find any case to support this option (buildhistory.bbclass:=
101).<br />- If not we dont need in fact to create files-in-package.txt on =
do_package, should files-in-package.txt creation be moved to do_packagedata=
?<br /><br />Thanks,<br /><br />Pedro

--akxMZs7ncGoLsDUxtlEW--

