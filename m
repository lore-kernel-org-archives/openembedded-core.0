Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5C2C5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:09:05 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8142.1786878536696289823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=ePNup+cF;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ghKQEczv;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id D84301D000DE;
	Sun, 16 Aug 2026 07:08:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 16 Aug 2026 07:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786878535;
	 x=1786964935; bh=clqs7aOxDoTNcy/55GcTOh8XBeh1QdGo0YUSZpdQbNE=; b=
	ePNup+cFmJb2lKA0bueFAB/I/S6Gv2H5QKGaPJCz9i652HAZFga1bnpMFeg3uRum
	sm8T0dVFBTX3xu5QQwE1TUjxjcW08FVCUqhGCsv6eIx18dF7k6b2768CJMKPh1Zs
	x9YuLcwYftVPFOUGIp+vLNUue/GRCLF5D4kL+qGkT8WKw0DmaTD4H2ec48gKoOeE
	twvOQRevApo30cSBEoYb+grHFSnVTNG6Ib3yACFMU5QF1X8j01NFxcAOkPLeV1uC
	RHsxaMEJyDx6yV+iUhoJqQG+Qgn1sh4YHfXbcedey/xIZHqovD7vmj8KwYeGEsi2
	FTNBbcj4IF6ZAEdxK58v6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786878535; x=
	1786964935; bh=clqs7aOxDoTNcy/55GcTOh8XBeh1QdGo0YUSZpdQbNE=; b=g
	hKQEczvvf5OE/vwbsiRPSpt9vMQQ1exFxMAXuTBVTaNBNUSGmu7HK6WPnPjjYiCE
	A6Jeziz3qiMkMKaegiGY460oDGCHP4X4TqL36kNIW1UQmerlNSWRyJcG9qAQ70cs
	JBPiqZKpa2X9kz5+Qmv96D9iR9smLcsc0POXSXYezObqwrjON8llpBg7SNAK21cC
	36PVqYGbSaL+Q8E/B4CYmxYDnR4dS3++lQADQPPpKu3AthmQFqlXQEX7+QkUrDxG
	Q/SH91ZvbyukuryLTkgn0Oad2BU0w3XiuDqeRNFtNN2oBnimajKhi7thD18+9qSS
	c87IVh4SskriNLM18qRpw==
X-ME-Sender: <xms:R5qBapztXPNHcaSFB2ri1zhPX2t6OGi9ZOioTmXui-qerjCETYEzUQ>
    <xme:R5qBagI6CIuhE0H-KmXLzqpDkoiaa1D5ryfIBm7fZa3vEFPWS5Ot25eW-i4Vn_eDw
    90ABgqFAIpIvJ7qQCmN4cX-z2groEw9oBc5vCgkPngAzNewY6yXzFuc>
X-ME-Received: <xmr:R5qBaroRiW-8RSPIihtzt3d4wf0kIYnrSf0F2DTqDF-Ec8AGEwLePP-EQLKK4O4EAh-RQMFyb96iVptaGWT5o8YnDz6JlP6Cv3dwbAOI6sGw>
X-ME-Proxy-Cause: dmFkZTFaLjvjZQaEqAV25+/F4Fofow03nCwcEkyb6bjWwaiEKrePgztg+moEm+A2hHHdpW
    8xqW4SLSBgenCzMeRhc2W/JgKvhnjKdR1SbJGTvSJqJI33YRMTeBaZ9YPTf4pAa6nCoHxt
    WsAVycTcQhP1UtDipUaJVrD3CdB9clL5Y8WMCngvTo4cBmTqRF2AWrClnrUNn9nuzOOs40
    +W3wQVsrg0eNdqlOfNUYu+Ur1VEaBdAVe0TYgq0NwUZnvkEEl/ZYFVLz39vrKw92jvcS2o
    cjkCBZeUt3y4NNnSs7kXuQOs54xbBYkuBLF6codN6qatssiJrINTABBBrsjUYoyWnV9DPT
    XPyzLMcHRY471yBO0JYSk/mHOyG5+3OPilQJ7hS4d++RBJspEOg4UjMhNvHikqgYWfgdmG
    pS9f8Upiu3Q2Eh2ymD/gc0KEWk4ULpH0DU+UB1Cysm7IV590twE+7VcFjxFZ2xUoli8CQv
    RHO8FYH5D/Yjus+bDQPfONkk4fP962vdbLqj7ncxBOD0w/1gvoZBMmHGQNX/nIQYphkPbt
    o5JR82Fqop50BfH2WBDwO6i9lMY0H86kCDXJdifPJj3o3MTRzd6Y+pl+vpBMEZQO11w89H
    K+x8JaRGbKqh0bLrnFrqn3aembb1ogQEHa0ANQTi+grMW7EeONwMrX4djBaA
X-ME-Proxy: <xmx:R5qBanLSYsyxPxK7KZN_2Hj34L6dJxmXwcmeMSMXMe2WFIp4qY4wWg>
    <xmx:R5qBaoTDU-HBRXO1BnGXKXKxoI42W44BJ0Q3UqEFUkjT6beN6ukJ1w>
    <xmx:R5qBausw_-tZmbQT7169XxtJpsiFaRqY0XYmWD1Ph1cYIPfPP3RdMg>
    <xmx:R5qBahY-ePqhQbBtbP2yZVh9Qk1uLzzHfmmsy6VKirThQ_35_7ZjoA>
    <xmx:R5qBagvtXGNkLE_dkUcEzqDWEHYiIzLV-tUFGj5gsGa4B-HWYp3T3K3d>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 07:08:54 -0400 (EDT)
Message-ID: <a9062529d1d715e7a7054b75a86f726a5149185c.camel@pbarker.dev>
Subject: Re: [PATCH v4 5/5] oeqa/selftest/devtool: Add test for multiple
 nested git destsuffix repos
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Date: Sun, 16 Aug 2026 12:08:53 +0100
In-Reply-To: <20260731092634.1127862-6-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
	 <20260731092634.1127862-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243515

On Fri, 2026-07-31 at 09:26 +0000, Jamin Lin wrote:
> Add test_devtool_modify_multi_git_destsuffix_standalone to verify that
> devtool modify converts all nested git repos (from multiple SRC_URI git
> entries with different destsuffix values, including a repo nested inside
> another repo's own working tree) to standalone clones so the workspace
> survives 'bitbake -c cleanall'.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 64 +++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index a10eb0c784..de73a2e620 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1265,6 +1265,70 @@ class DevtoolModifyTests(DevtoolBase):
>          self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bi=
tbake'), 'Submodule not found')
>          self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bi=
tbake-gitsm-test1'), 'Submodule not found')
> =20
> +    def test_devtool_modify_multi_git_destsuffix_standalone(self):
> +        """
> +        Verify that devtool modify converts all nested git repos (from m=
ultiple
> +        SRC_URI git entries with different destsuffix values) to standal=
one clones
> +        so that 'bitbake -c cleanall' does not break the devtool workspa=
ce.
> +
> +        The recipe (devtool-test-multi-destsuffix) has three git SRC_URI=
 entries
> +        with S =3D ${UNPACKDIR}, each nested inside the previous repo's =
own
> +        working tree:
> +            destsuffix=3Dlevel1               -> srcdir/level1/
> +            destsuffix=3Dlevel1/level2        -> srcdir/level1/level2/
> +            destsuffix=3Dlevel1/level2/level3 -> srcdir/level1/level2/le=
vel3/
> +
> +        This mirrors real-world recipes that embed multiple module repos
> +        as nested subdirectories of the primary source tree, including t=
he
> +        case where one repo's checkout lives inside another repo's worki=
ng
> +        tree rather than merely under a shared plain directory.
> +        """
> +        testrecipe =3D 'devtool-test-multi-destsuffix'
> +        src_uri =3D get_bb_var('SRC_URI', testrecipe)
> +        self.assertIn('git://', src_uri,
> +                      'This test expects %s to have git SRC_URI entries'=
 % testrecipe)
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('devtool reset %s' % testrecipe)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
> +        result =3D runCmd('devtool modify %s' % testrecipe)
> +        self.assertEqual(result.status, 0,
> +                         'devtool modify failed: %s' % result.output)
> +        srcdir =3D os.path.join(self.workspacedir, 'sources', testrecipe=
)
> +        nested_paths =3D [
> +            ('level1', 'level1'),
> +            ('level2', 'level1/level2'),
> +            ('level3', 'level1/level2/level3'),
> +        ]
> +
> +        for name, subpath in nested_paths:
> +            repo_path =3D os.path.join(srcdir, subpath)
> +            self.assertExists(os.path.join(repo_path, '.git'),
> +                              'Repo %s (.git) not found in devtool works=
pace' % name)
> +
> +        # Key assertion: no nested repo should retain a git alternates f=
ile.
> +        # devtool modify must repack objects locally so the workspace do=
es not
> +        # depend on the downloads cache, which 'bitbake -c cleanall' wil=
l delete.
> +        for name, subpath in nested_paths:
> +            repo_path =3D os.path.join(srcdir, subpath)
> +            alternates_file =3D os.path.join(repo_path, '.git', 'objects=
',
> +                                           'info', 'alternates')
> +            self.assertNotExists(alternates_file,
> +                                 'Repo %s still has a git alternates fil=
e after '
> +                                 'devtool modify' % name)
> +
> +        # Verify the workspace survives cleanall, which removes the shar=
ed
> +        # objects in the downloads cache that alternates would reference=
.
> +        bitbake('%s -c cleanall' % testrecipe)

We can't use cleanall here as it deletes data from the main downloads
directory. Is the above check for an alternates file not sufficient? If
not then this test needs to use an isolated downloads directory.

Best regards,

--=20
Paul Barker


