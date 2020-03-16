Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 386436023A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 20:36:51 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v6so8553768edw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 13:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Q9LWBB+R6asP7/8ZFKYhvgLjhlRFigFxoh3KlT+fG5U=;
	b=TmdKvbWrZTMG1dJqI9sVMl8l0/jrHYrIyJvH5vmPfCNl+qqeATbOMkv95X8IUc5gL6
	BC7w2ILJjmTgW9RzjqudAMYiy6EfodR0qpL/4W5FB34+OHRaSxc5tF2D+mp2s5GZ33Ha
	5e38MHLDlxVKjTb7K7J12qUYAOeWXdYlICf5zMJNuEL+j7aNiryRe3XrMj6DIOE5YzoE
	PM7O25HUgU43Tk5DTZAxJAM+ZMTjdym85e2XawmDjHyx5mlTY5ha+UUvYQDngNolfxDN
	io8dqUdZa+MgXnaPhEABFxA9YU3cXZ+STkvUqSaHuSx+7YfT8DjgHhUXncsqg+yw/JtG
	U6NA==
X-Gm-Message-State: ANhLgQ0IchOgARnzWQSgQBex5N/7j8S1UmnFcYHxzElo7Kz4+KuSqnLS
	azuOoEGNdyHqs4DunSzJ7fgQBEft
X-Google-Smtp-Source: ADFU+vt0HL2ax8mREqXxMc2PdOj7Lyb/b55ALmHvr1cPNPUr0TSCINiQW2vlQlxo3Y3dVRN6GFPBaA==
X-Received: by 2002:aa7:d8ca:: with SMTP id k10mr1865399eds.60.1584391011692; 
	Mon, 16 Mar 2020 13:36:51 -0700 (PDT)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id a59sm68071ede.71.2020.03.16.13.36.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 13:36:50 -0700 (PDT)
Message-ID: <c741696cac17d9b3cc50630c32ba9b0a46396cf0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 20:36:50 +0000
In-Reply-To: <CAMKF1spN-06_oN-gnXO8osuKva3DerMBoGJ8zf41ybQPtm2Csw@mail.gmail.com>
References: <20200316190628.19383-1-raj.khem@gmail.com>
	<62485e60-999e-54c6-09a6-590a8a3e2072@gmail.com>
	<CAMKF1spN-06_oN-gnXO8osuKva3DerMBoGJ8zf41ybQPtm2Csw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa: Extend parselogs to rpi4
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
X-List-Received-Date: Mon, 16 Mar 2020 20:36:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-16 at 12:17 -0700, Khem Raj wrote:
> On Mon, Mar 16, 2020 at 12:12 PM akuster808 <akuster808@gmail.com> wrote:
> > 
> > 
> > On 3/16/20 12:06 PM, Khem Raj wrote:
> > > rpi had additional diagnostics which should be ignored [1]
> > > 
> > > [1] https://github.com/raspberrypi/linux/issues/3195
> > 
> > So does this mean OE will take similar patches for every BSP in the world?
> > 
> 
> suggest a better way and I will do that in BSP layer.

Not sure about better way, but in my BSP layer I have:

layer.conf:
-----------
DEFAULT_TEST_SUITES_remove_mx7d = "parselogs"
DEFAULT_TEST_SUITES_append_mx7d = " parselogs_mx7bsp"

lib/oeqa/runtime/cases/parselogs_mx7bsp.py:
-------------------------------------------
from oeqa.runtime.cases.parselogs import *

mx7bsp_errors = [
    'list of messages',
]

ignore_errors['mymachine'] = mx7bsp_errors + common_errors

class ParseLogsTestMX7BSP(ParseLogsTest):
    pass


A.

> 
> > - armin
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/lib/oeqa/runtime/cases/parselogs.py | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> > > index cc4f5f8c78..48712d4dac 100644
> > > --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> > > +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> > > @@ -183,6 +183,11 @@ ignore_errors = {
> > >          'Failed to make EGL context current',
> > >          'glamor initialization failed',
> > >          ] + common_errors,
> > > +    'raspberrypi4-64' : [
> > > +        'bcmgenet fd580000.genet: failed to get enet-eee clock',
> > > +        'bcmgenet fd580000.genet: failed to get enet-wol clock',
> > > +        'bcmgenet fd580000.genet: failed to get enet clock',
> > > +        ] + common_errors,
> > >  }
> > > 
> > >  log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]


