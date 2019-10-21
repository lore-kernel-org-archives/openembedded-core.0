Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 122117F316
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 15:27:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b24so13225566wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vEKdgi7ZN0Yc/TVkPJ8pzBKOrtn3YJQlrsWI2U/tMdg=;
	b=X0sMJ/pV3TF9oWt3asArWkBcpbcdWKqkd8BVHCXMsfx+OUniMoX65BV1Xa9OKEUsZK
	SFIx2kiqobqYCs4LOQIuI1fzrb8SqMuvXGRdmdXYx6KuE6FNe5UlM2PzDdmdKfEtL3ur
	hirPBNCTX1JsOfERW7L5YxSsXx2BUgo3uIwYPrg6wa4pTkoeCQci1MeYQS9g305GDDfx
	LbVbbOJ5VJJIX/hwYOutlLAbqaswGCgp7IbxEzVLzzs/6+EGwk6DT43GshiWh6RBhvBG
	AtnsJ9yLf0SKtVPnrMSMnDWal1oo2T1cXWp9uWksBwMryLhv7k/k3O84LGa3I9r+c2WB
	ooMA==
X-Gm-Message-State: APjAAAX1S7u2RwVGmDzVt1eiHOmQJyDJKq7i+cHLrjDMQi1NCOoyLLaK
	mjluIDI6HFCE6kFN1KtIUKk=
X-Google-Smtp-Source: APXvYqwzKy0QmNpvIMeFxirH050CTz14MKVdgg8Iid85WIo+tJhVjYN2rQurfmZyVuxIfOVrl1pJbA==
X-Received: by 2002:a05:600c:219:: with SMTP id
	25mr6397154wmi.174.1571671624664; 
	Mon, 21 Oct 2019 08:27:04 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a3sm15723974wmj.35.2019.10.21.08.27.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 08:27:04 -0700 (PDT)
Message-ID: <8b38414b10bb579903ba594fd35eb4aec08548f3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 16:27:03 +0100
In-Reply-To: <45a4bfc3-db54-3aa0-bab9-85ddde056c1d@gmail.com>
References: <20191021104659.27059-1-git@andred.net>
	<45a4bfc3-db54-3aa0-bab9-85ddde056c1d@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] connman: mark connman-wait-online as SYSTEMD_PACKAGE
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
X-List-Received-Date: Mon, 21 Oct 2019 15:27:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-10-21 at 07:51 -0700, akuster808 wrote:
> 
> On 10/21/19 3:46 AM, André Draszik wrote:
> > The connman-wait-online package currently isn't marked as
> > systemd-enabled package. This means it is impossible to
> > auto-enable the service during image creation or package
> > installation, as no preset files and no pkg_postinst()
> > snippet is being created.
> > 
> > This change should have been done as part of the
> > upgrade to v1.31
> 
> With backport to zeus?

I'd say so (once merged).

Cheers,
Andre'

> 
> - armin
> > Note:
> > connman-wait-online is needed when connman is in use
> > in more complex network/interface setups for systemd's
> > network-online.target to report success.
> > systemd-networkd's systemd-networkd-wait-online.service
> > alone doesn't work in such scenarios and simply times
> > out, as it know nothing about the expected network/
> > interface configuration, meaning the target doesn't
> > boot successfully (systemctl list-units --failed),
> > and long delays are seen, caused by waiting for the
> > systemd-networkd-wait-online.service timeout.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >  meta/recipes-connectivity/connman/connman.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> > index ee00479926..fb38ab4fc1 100644
> > --- a/meta/recipes-connectivity/connman/connman.inc
> > +++ b/meta/recipes-connectivity/connman/connman.inc
> > @@ -59,7 +59,7 @@ INITSCRIPT_NAME = "connman"
> >  INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
> >  
> >  python __anonymous () {
> > -    systemd_packages = "${PN}"
> > +    systemd_packages = "${PN} ${PN}-wait-online"
> >      pkgconfig = d.getVar('PACKAGECONFIG')
> >      if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
> >          systemd_packages += " ${PN}-vpn"


