Return-Path: <andrew@bradfordembedded.com>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 440F873193
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 12:52:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C33D52088A;
	Fri, 17 Jun 2016 08:52:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 17 Jun 2016 08:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=OT+wa1U64G7almiuRN1hu4A01m8=; b=YzmJSg
	h+OTOOJNsd6dt+H/bZQf7FX+ZEjIANYtW3nHdPsOXf7PKMLRalEGAEVdPk+Kebmk
	I6h5TggXrEcAeb+zDBZg9LxmmukG26xLXOUMCoyu74YyIFXoiPtPLkCmSC/MvfwQ
	dO7v0bS07OKGWmXvS6EGJ9E4oTn9Ldkqt6cN4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=OT+wa1U64G7almiuRN1hu4A01m8=; b=SH8a5
	T60KWmz0YvTTtjznLbboKyR4BzxRxxEReKzoWSOhNCIyhQ1XqnLQSMAijzpVT3I1
	VSzzfra6ghxDvEtQS3KKYMnAZThT7hLmUHr31tjh1KkGK6/zAk91OK6THgA8gXX+
	naO2LMngU4+62nKK2FzW9dS3JD4irXnOzhzvPs=
X-Sasl-enc: MoZj0Oqg6m7NK5hA7FSwR4ol9G7jgwKhrWKSAF/oW+5Y 1466167951
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6A388CCDAB;
	Fri, 17 Jun 2016 08:52:31 -0400 (EDT)
Date: Fri, 17 Jun 2016 08:52:30 -0400
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160617125230.GA9776@kaim-eeyore.kodakalaris.net>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
	<1464205571-26293-4-git-send-email-andrew@bradfordembedded.com>
MIME-Version: 1.0
In-Reply-To: <1464205571-26293-4-git-send-email-andrew@bradfordembedded.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: Re: [PATCH 3/3] base.bbclass: p4 fetcher supports srcrev
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
X-List-Received-Date: Fri, 17 Jun 2016 12:52:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

On 05/25 15:46, Andrew Bradford wrote:
> From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> Enable the perforce fetcher to call bb.fetch2.get_srcrev() as it can use
> 'SRCREV = "${AUTOREV}"'.
> 
> Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
> ---
>  meta/classes/base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 4be0a7e..9f3945c 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -569,6 +569,10 @@ python () {
>              needsrcrev = True
>              d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
>  
> +        # Perforce packages support SRCREV = "${AUTOREV}"
> +        elif scheme == "p4":
> +            needsrcrev = True
> +
>          # OSC packages should DEPEND on osc-native
>          elif scheme == "osc":
>              d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')

I noticed that this patch has not been applied to oe-core, but it is a
dependency for the bitbake perforce fetcher change to support srcrev
which has been applied to bitbake's master branch [1].

[1]:http://git.openembedded.org/bitbake/commit/?id=6298696bb94a127cdec7964315f6891ba92cd026

Any chance that this patch could be applied to oe-core?
The other two patches in this series are not needed, just this one.
Sorry if my bitbake patch was not super clear about this dependency.

Thanks!
-Andrew

