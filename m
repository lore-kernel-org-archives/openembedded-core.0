Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB7F60796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBIEIDF2009592; Fri, 18 Dec 2015 14:18:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jkt2X2oCDOWI; Fri, 18 Dec 2015 14:18:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBIEICp2009577
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 18 Dec 2015 14:18:13 GMT
Message-ID: <1450448292.8461.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:18:12 +0000
In-Reply-To: <19CCFDE4-E8FC-4B6A-BFD4-BCB6E14922C8@linux.intel.com>
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1450427985-12504-3-git-send-email-markus.lehtonen@linux.intel.com>
	<1450441360.8461.37.camel@linuxfoundation.org>
	<19CCFDE4-E8FC-4B6A-BFD4-BCB6E14922C8@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] kernel.bbclass: copy .config instead of moving
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
X-List-Received-Date: Fri, 18 Dec 2015 14:18:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-12-18 at 14:39 +0200, Markus Lehtonen wrote:
> On 18/12/15 14:22, "Richard Purdie" <
> richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2015-12-18 at 10:39 +0200, Markus Lehtonen wrote: 
> > >  	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! 
> > > -f
> > > "${B}/.config" ]; then
> > > -		mv "${S}/.config" "${B}/.config"
> > > +		cp "${S}/.config" "${B}/.config"
> > >  	fi
> > >  
> > >  	# Copy defconfig to .config if .config does not exist.
> > > This
> > > allows
> > 
> > I'm not sure about this, doesn't this trigger the kernel to see
> > ${S} as
> > being 'dirty' and cause other issues when you try and do out of
> > tree
> > builds with it?
> 
> That shouldn't be a problem as the kernel .gitignore ignores .config
> (or '.*' to be more specific). There are other tasks that make
> changes to the kernel source tree, as well, like do_kernel_metadata.
> 
> 
> > It also means we have two copies of "config" around which can end
> > up
> > being different and confuse users no end :(.
> 
> Yes, I must agree. What do you think if ${B}/.config would be a
> symlink to ${S}/.config? I.e.
> +               ln -s "${S}/.config" "${B}/.config"
> 

I think I'd prefer we move the file over the ${B} and then symlink from
${S} since that way if its modified, its mostly likely to be done from
${B} at least by the automated code?

Cheers,

Richard

