Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5531877E79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:24:04 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id i189so13270864wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 01:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PgrdRwHOij+hZ2qNNtorNqulnNtYzEzHFV9y56PbQxI=;
	b=NRn2pRCSov2FdRynB46zC4ll6ECZNnJQf0oERBiN6NK6ZAGd7LbSy6kUWrc/eelAas
	uUOpHs+pfXfie+8aOTQnyyHONKx425mpQIPo1poU3zqtDyx/Q+We6DR0knQ1jR6e/KKm
	NEhWhupB9ba37AzHQhunWCqci8S6AEOF8joSzqNE1fMXmGVDIjorcVSj5YyLNq9Plh7e
	i0EaUqASzNj6XKUpFointL3dLtpK6ynAMnNRPPNZUflICCV/IMjVDLoI6IdTgzlX2xcU
	LIZmZZFbjwqL7kHeJs8dri5ZVMsHr13JntptzaCu+A837TtTtFCAqEmdUNtNOpdQw191
	r0tw==
X-Gm-Message-State: AHPjjUiUvB5jrzRn7Fg55N991lC5lKkK2GmvkG8a4A34537eVDRGuvZ3
	CzeMa1pAbnZwRnUYHKyF4Ek=
X-Google-Smtp-Source: AOwi7QCYld4XGIWjjFqrLs87rGGNwnHP/lMVNME9oOjPl/UnTbfj/MeDP42rvv7k7tg58CCL24+ShA==
X-Received: by 10.28.157.81 with SMTP id g78mr238836wme.102.1505982245955;
	Thu, 21 Sep 2017 01:24:05 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g13sm1066459wrg.63.2017.09.21.01.24.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Sep 2017 01:24:04 -0700 (PDT)
Message-ID: <1505982238.19222.12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 09:23:58 +0100
In-Reply-To: <973534e8429b40d0bcad50c5adecee50@XBOX02.axis.com>
References: <20170904093726.11472-1-git@andred.net>
	<101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
	<1504597240.29140.10.camel@andred.net>
	<1505899714.19222.9.camel@andred.net>
	<973534e8429b40d0bcad50c5adecee50@XBOX02.axis.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] useradd-staticids: don't create username-group if	gid is specified
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
X-List-Received-Date: Thu, 21 Sep 2017 08:24:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-09-20 at 14:20 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: André Draszik [mailto:git@andred.net]
> > Sent: den 20 september 2017 11:29
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] useradd-staticids: don't create
> > username-group if gid is specified
> > 
> > ping
> 
> Sorry, I forgot to reply to this.
> 
> > On Tue, 2017-09-05 at 08:40 +0100, André Draszik wrote:
> > > On Mon, 2017-09-04 at 10:22 +0000, Peter Kjellerstedt wrote:
> > > > > 
> > > 
> > > [...]
> > > > > diff --git a/meta/classes/useradd-staticids.bbclass
> > > > > b/meta/classes/useradd-staticids.bbclass
> > > > > index ce4ac62ab5..1b61a8bf9b 100644
> > > > > --- a/meta/classes/useradd-staticids.bbclass
> > > > > +++ b/meta/classes/useradd-staticids.bbclass
> > > > > @@ -102,7 +102,7 @@ def update_useradd_static_config(d):
> > > > >              # So if the implicit username-group creation is on,
> > > > > then the implicit groupname (LOGIN)
> > > > >              # is used, and we disable the user_group option.
> > > > >              #
> > > > > -            user_group = uaargs.user_group is None or
> > > > > uaargs.user_group is True
> > > > > +            user_group = uaargs.gid is None or uaargs.user_group
> > > > > is True
> > > > 
> > > > Hmm, I believe that should be:
> > > > 
> > > >             user_group = uaargs.gid is None and uaargs.user_group is
> > > > None or uaargs.user_group is True
> > > > 
> > > > I.e., if neither --gid nor --user-group is specified, then it should
> > > > treat it as if --user-group was specified.
> > > 
> > > Hm, isn't this still the same as
> > > 
> > > user_group = uaargs.gid is None or uaargs.user_group is True
> 
> No, because uaargs.user_group may be False if --no-user-group is 
> specified (which I of course should have mentioned in my previous 
> reply). With your version, you would still get a user group even 
> if --no-user-group is specified.

OK, this is how useradd behaves:

useradd --system --home /dev/null --no-create-home --no-user-group distcc
  -> will add the new user to the group 'users' (as per GROUP from /etc/default/useradd)

useradd --system --home /dev/null --no-create-home --gid foo --user-group distcc
  -> --gid and --user-group together conflict

useradd --system --home /dev/null --no-create-home --user-group distcc
useradd --system --home /dev/null --no-create-home distcc
 -> in both cases distcc user and group are created


Sp, what about this instead:

            if uaargs.gid:
                uaargs.groupname = uaargs.gid
                uaargs.groupid = field[3] or uaargs.gid 
            elif uaargs.user_group is not False:
                uaargs.groupname = uaargs.LOGIN
                uaargs.groupid = field[3] or uaargs.LOGIN
            else:
                uaargs.groupname = 'users'
                uaargs.groupid = field[3] or 'users'

Cheers,
Andre'

> > > ? If neither --gid nor --user-group is specified, then gid is None, so
> > > it
> > > will do what you want already. IOW, unless the group name (gid) is
> > > specified, a username-group is being created.
> > > 
> > > 
> > > Cheers,
> > > Andre'
> 
> //Peter
> 

