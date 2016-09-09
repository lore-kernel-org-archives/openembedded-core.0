Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id A81EE7016E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 18:34:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1E41E20226
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 14:34:56 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 09 Sep 2016 14:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=R0msPPtNkLsc9GZ
	w4FoKUUk/Zjk=; b=jOUl/fP8oSiC9tbb8VMSN61dUFgCz3R/H1ucqW47JRTEVDB
	ZeDUdKR8ZU3xrIQjoPSmZKWWFSo510QtMBLZHc3fXILqud7cJSqU1o9RKAXDdOmF
	o67e7UKjkgi7arHq2dlFhGjiV1g5+tNvUilRwyvBq6wj2Z2z0F37HkAUuiL8=
X-Sasl-enc: sq855HM/0mqHlcWCwWMeX2tS0hUdciX6Kqvz7n9PptU/ 1473446095
Received: from laptop (a88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8FABACCE8C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 14:34:55 -0400 (EDT)
Message-ID: <1473446094.32735.82.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri, 09 Sep 2016 21:34:54 +0300
In-Reply-To: <CAEGpDuY+WMMmwZ1b99zA1zCYrAke8pnUyG3B03dummFU6=PN0Q@mail.gmail.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<72f9c03cf7bb25482acc9c40b775a4f294e772b6.1473240119.git.Qi.Chen@windriver.com>
	<CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com>
	<57D10664.3050007@windriver.com> <1473333722.3099.33.camel@iki.fi>
	<CAEGpDuY+WMMmwZ1b99zA1zCYrAke8pnUyG3B03dummFU6=PN0Q@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] pulseaudio: fix to manage user services corretly
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
X-List-Received-Date: Fri, 09 Sep 2016 18:34:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-09 at 20:10 +0200, Pau Espin Pedrol wrote:
> Hi,
> 
> I think I didn't express myself correctly. Please note I did the
> longer investigations quite a while ago and I'm mainly talking from
> memory, so I may be wrong in some of the assumptions.
> 
> From systemd.bbclass, you can see this:
>             if service.find('.socket') != -1:
>                 # for *.socket add *.service and *@.service
>                 service_base = service.replace('.socket', '')
>                 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '.service', keys)
>                 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '@.service', keys)
> 
> 
> So, for installation purposes, no .service is required in
> SYSTEMD_USER_SERVICE. Setting it .socket should also install (but not
> enable) the .service file together with the .socket one into the
> image, as actually the .socket one usually depends on the .service
> file at runtime.
> 
> That being said, of course it's not the same behavior if you add only
> one of them, the other or both:
> 1- Adding only .service -> It will install + enable the .service
> 2- Adding only the .socket -> It will install both. It will enable .socket
> 3- Adding .service + .socket -> It will install both. It will enable both.
> 
> Usually, you want either only the .service to be enabled (1, which
> will start it automatically at startup of user session), or only the
> .socket enabled (2, which will start only the socket at startup of
> user session, and only start pulseaudio process when required by some
> pulseaudio client). The third case, that is, installing + enabling
> both is usually not a good idea, at least it makes no sense to me.
> 
> So, we should consider only "1" or "2". I would personally go for 2nd
> option, and probably disable pulseaudio own autospawn system as
> explained by Tanu. This way we don't start pulseaudio unless when it's
> actually needed.
> 
> That is:
> +SYSTEMD_PACKAGES = "${PN}-server"
> +SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.socket"
> 
> And by the way, you  should be able to remove
> "${systemd_user_unitdir}/*" from FILES_${PN}-server as it should be
> handled automatically by systemd.bbclass. If that's not the case, then
> probably there's some error in systemd.bbclass you should look into.
> 
> Hope I explained myself better now. Regards!

Thanks for the explanation. Part of my confusion was that I incorrectly
assumed that systemd.bbclass couldn't guess that the pulseaudio-server
package contains systemd units (due to the -server suffix), and
therefore it seemed to me that SYSTEMD_USER_SERVICE is expected to
contain all units, but that problem is fixed by the SYSTEMD_PACKAGES
variable.

Still, I think SYSTEMD_USER_SERVICE is a misleading variable name, if
the actual purpose of that variable is only to control which units to
enable during installation. Something like SYSTEMD_USER_ENABLE_UNITS
would be better. However, this problem is older than these patches (due
to SYSTEMD_SERVICE for system units), so I don't suggest that the
patches should be changed because of this. It indeed seems like the
best course of action would be to only add the pulseaudio.socket unit
to SYSTEMD_USER_SERVICE. Patching client.conf to disable autospawning
in case systemd is enabled would be a good addition, although not
strictly necessary.

-- 
Tanu

