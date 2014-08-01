Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id EBBBF65F81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:37:50 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20140801073750976
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Aug 2014 07:37:50 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=41944 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XD7PN-0004Su-Be; Fri, 01 Aug 2014 03:37:45 -0400
Date: Fri, 1 Aug 2014 03:37:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Chong Lu <Chong.Lu@windriver.com>
In-Reply-To: <26c2d48cccb6fb2dfe6dd00dbb4ab191b7bd2b4d.1406876955.git.Chong.Lu@windriver.com>
Message-ID: <alpine.LFD.2.11.1408010337001.31066@localhost>
References: <cover.1406876955.git.Chong.Lu@windriver.com>
	<26c2d48cccb6fb2dfe6dd00dbb4ab191b7bd2b4d.1406876955.git.Chong.Lu@windriver.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oelint.bbclass: Check for ${PN} or ${P} usage
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
X-List-Received-Date: Fri, 01 Aug 2014 07:37:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 1 Aug 2014, Chong Lu wrote:

> Check for ${PN} or ${P} usage in SRC_URI or S.
> We should use ${BPN} or ${BP} instead to avoid breaking multilib.
>
> [YOCTO #5427]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/classes/oelint.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
> index 0bed74a..685a88d 100644
> --- a/meta/classes/oelint.bbclass
> +++ b/meta/classes/oelint.bbclass
> @@ -62,4 +62,24 @@ python do_lint() {
>                      bb.warn("${PN}: %s doesn't have Signed-off-by" % item)
>                  if findKey(path, "Upstream-Status"):
>                      bb.warn("${PN}: %s doesn't have Upstream-Status" % item)
> +
> +
> +    ##############################
> +    # Check for ${PN} or ${P} usage in SRC_URI or S
> +    # Should use ${BPN} or ${BP} instead to avoid breaking multilib
> +    #
> +    s = d.getVar("SRC_URI").split()
> +
> +    for srcurl in s:
> +        if not srcurl.startswith("file://"):
> +            if not srcurl.find("{PN}") == -1:
> +                bb.warn("${PN}: Should use BPN instead to PN in SRC_URI")
> +            if not srcurl.find("{P}") == -1:

  should you not say, "use BPN instead of PN ..."?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


