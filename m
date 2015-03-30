Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id F405173C48;
	Mon, 30 Mar 2015 18:49:22 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so184082508pdb.1;
	Mon, 30 Mar 2015 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=snAji+w/rVYtPsyoeD10RC++dns19fQ8AHIkSOJkGn4=;
	b=nZLB+wOJqXfoEO0u1g92L9g0kSZBBqpjQMUHi/H8+niwl+FR63o5kyHGxJSSuFDIcl
	z/ixLFz6RaNcFraU7UBDuPZlHJ9qd95bHNfZL4Ph/rmKM8v7nwSCA0LjsMuhFzE66Q6O
	7iF38oRQ44wrAyQvig9FE+8KZ5MPY4ligV5PkJrepf0ICHjTR1zlF7qutvuuslVeH9ZO
	drP0PEJNmXrEHdOXGXljHmgxQRPZosIvoAzzun8OnVudhm6/1uK4qWz/AQSBwl++DHU8
	Y4jteINquuvFrSpIfJ1f18brGKpNjNvVTEuWie/0dc0Orem+t4qQxJG6duXdwW8UhG5B
	8RIA==
X-Received: by 10.69.12.227 with SMTP id et3mr61425442pbd.79.1427741364062;
	Mon, 30 Mar 2015 11:49:24 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:d184:5f67:5f61:2cc2?
	([2601:9:500:ece:d184:5f67:5f61:2cc2])
	by mx.google.com with ESMTPSA id
	cz10sm11446056pdb.9.2015.03.30.11.49.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Mar 2015 11:49:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150330184627.GD14928@jama>
Date: Mon, 30 Mar 2015 11:49:21 -0700
Message-Id: <FADF8578-9B17-41E3-A0FB-C7A132FE83A7@gmail.com>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
	<CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
	<1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
	<20150330184627.GD14928@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 30 Mar 2015 18:49:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 30, 2015, at 11:46 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Mon, Mar 30, 2015 at 09:41:30AM -0700, Khem Raj wrote:
>>=20
>>> On Mar 30, 2015, at 3:09 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>>=20
>>>=20
>>> On 29 March 2015 at 00:28, Martin Jansa <martin.jansa@gmail.com =
<mailto:martin.jansa@gmail.com>> wrote:
>>> WEBOS_FONTCONFIG_CACHE =3D "${datadir}/fontconfig/cache"
>>>=20
>>> I'm sure there's a good reason why fontconfig caches are going in =
datadir but I'm not sure I want to know it :)
>>>=20
>>=20
>> aren=E2=80=99t they variable data files ? where else should it go =
otherwise=20
>=20
> I've replied to Ross off-list because I'm not sure how much details I
> should share, but basically we have read-only rootfs which has all the
> font packages installed, so cache from do_rootfs should remain valid
> forever. And we delete everything in /var during reset to factory
> settings (that's why we had to move everything which we want to =
persist
> during factory resets like this cache).
>=20
> We also have additional fontconfig patch which ignores timestamp
> modifications in font directories, so that the cache is considered =
valid
> even after some manual modification in rootfs (e.g. in devel images
> which can be switched to read-write mode).

may be copy-binds could be deployed ?

>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


