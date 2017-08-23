Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A5D3B78248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:44:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7NCijF5022181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 13:44:46 +0100
Message-ID: <1503492285.32591.152.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, Randy MacLeod
	<randy.macleod@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Wed, 23 Aug 2017 13:44:45 +0100
In-Reply-To: <1abbf9f3-8f0e-3fba-26f5-114f049cb977@siemens.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
	<c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
	<dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
	<1abbf9f3-8f0e-3fba-26f5-114f049cb977@siemens.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 13:44:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Wed, 23 Aug 2017 12:44:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-23 at 14:07 +0200, Andrej Valek wrote:
> I have found out that even master with HOSTTOOLS does not fix my
> problem.
> We use ASSUME_PROVIDED for ca-certificates-native due to corporate
> environment CAs.
> Since nativesdk-ca-certificates depends on ca-certificates-native
> whichis not built, so it could not be found. Unfortunately adding
> update-ca-certificates to HOSTTOOLS is not working, since build user
> does not have permissions to modify system CAs and also is in
> /usr/sbin/ which is not in usual system path.
> 
> Therefore I think that this patch applies for master branch, too.
> Possible improvement would be also removing ca-certificates-native
> from DEPENDS of class-nativesdk.
> 
> Solution of installing corporate CAs within OE recipe does not seem
> to be ideal, because the CAs have short expiration date. So using
> system CAs assures reachability of resources over https.
> We had to do this because svn fetcher uses https without option to
> ignore errors (unlike wget which ignores certificates by default).

Reading this made me realise this is a pretty complex issue. In general
we cannot assume that we can execute nativesdk binaries. Since ca-
certificates is allarch and we're executing an sh script, this is less
of an issue in this very specific case. There is a binary involved,
c_rehash and we do need to make sure there are the right -native
dependencies to get that.

There is a further complication with regard to the paths used, ca-
certificates-native will use one set of paths, nativesdk-ca-
certificates will use a different set and target ca-certificates a
differnt set again.

I suspect you're right and the ca-certificates-native dependency may be
incorrect and the certs installed into sdks may be broken too. If the
native sysroot and target sysroot layouts don't match, that would cause
an additional source of errors.

So some changes in this area does appear to be needed...

Cheers,

Richard



