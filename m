Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.12370.1604495733086375483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 05:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:59372 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kaIdO-00Bu1R-OF; Wed, 04 Nov 2020 08:15:31 -0500
Date: Wed, 4 Nov 2020 08:15:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <ross@burtonini.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] setuptools3: use DEPENDS_append instead of +=
In-Reply-To: <20201104121217.4013924-3-ross.burton@arm.com>
Message-ID: <d16dcccf-c257-6a9b-209e-41bfb440726@crashcourse.ca>
References: <20201104121217.4013924-1-ross.burton@arm.com> <20201104121217.4013924-3-ross.burton@arm.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2020, Ross Burton wrote:

> To help people who inherit setuptools3 and then assign DEPENDS with =.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/setuptools3.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
> index 8ca66ee708e..4e6a9343d77 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -1,4 +1,3 @@
>  inherit distutils3
>
> -DEPENDS += "python3-setuptools-native"
> -
> +DEPENDS_append = " python3-setuptools-native"

  i've wondered about this sort of thing for a while (and been burned
by similar things a time or two). admittedly, the above is an obvious
example where that dependency really needs to be there, no question.
but what about cases where the developer inherits a class file and
explicitly wants to set his own dependencies, not realizing the class
file uses "+=" (which he promptly steps all over by accident)?

  is there a standard that suggests that, say, class files always use
"_append" since they know what they're doing and want to protect the
user from being silly? or is there at least some responsbility on the
part of the developer to be at least minimally aware of what the class
file might be doing?

  thoughts?

rday


