Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjAuR-0006ot-NS for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 15:36:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06ETJwR021550
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 14:29:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21013-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 14:29:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06ETBlS021544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 14:29:12 GMT
Message-ID: <1325860152.20759.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 14:29:12 +0000
In-Reply-To: <1325856888.20759.119.camel@ted>
References: <cover.1325302234.git.lianhao.lu@intel.com>
	<03140960a07a85cb0549d0cb8fab4ee09281ba6a.1325302234.git.lianhao.lu@intel.com>
	<1325856888.20759.119.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PRService/meta V2 1/3] meta/PRService: Added export/import fuctions.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 14:36:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 13:34 +0000, Richard Purdie wrote:
> This is good and rather inventive but I'm a little worried about the way
> we're interfacing to bitbake. I appreciate the codebase doesn't give us
> a lot of good ways to do this but we perhaps need to find better ways
> even if this means extending bitbake. I'm particularly worried that we
> need to add a new recipe and an extra task to every recipe to make this
> work.
> 
> I'm wondering if we could do something like this with an event handler:
> 
> meta/classes/primportexport.bbclass:
> """
> python primportexport_handler () {
>     if not e.data:
>         return
> 
>     if isinstance(e, bb.event.RecipeParsed):
>         [code like do_prservdump here]
> 
> }
> 
> addhandler primportexport_handler
> """
> 
> meta/conf/primpexp.conf:
> """
> INHERIT += "primportexport"
> """
> 
> and then scripts/bitbake-prserv-tool for exporting would do something
> like:
> 
> bitbake prserv-misc -c dbexport_clean 
> bitbake prserv-misc -c dbexport_metainfo
> touch meta/conf/primpexp.conf
> bitbake -p -R meta/conf/primpexp.conf
> 
> 
> You could also trigger the db_export_clean/dbexport_metainfo on
> bb.event.ParseStarted and write out the variables upon the
> bb.event.ParseCompleted event? This might mean we could end up not
> needing the prserv-misc.bb recipe at all? It would also simplify the
> script we need to run these commands and hopefully make the code
> simpler.
> 
> Also, for large amounts of python code, we're tending to place this into
> meta/lib/*.py files now since these have less parsing overhead and tend
> to lend themselves better to creation of python classes. Could you see
> if it would make sense to add a prserv.py file there containing some of
> these functions. As an example of usage, this commit is one I recently
> made doing something like this for the multlib code:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=8e43f9a751f1637d483d48aa9a9a647d1e3d2003
> 
> The clear benefit in the above case comes later, in this patch where we
> can do something like:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/useradd5&id=46f5223df4e9ab6e954f1f59073793703f2ec581
> 
> but in general I think larger amounts of python code make more sense in
> lib/oe/*.py
> 
> What do you think?

Just to add, I'm not saying this has to be done this way. I think the
above likely works and will be clearer and easier to understand
(improving long term maintenance too) but if anyone can see a better
way, I'm open to ideas.

It might also be  worth adding a "force-reparse" option to bitbake so
that the "touch xxx.conf" above isn't needed.

Cheers,

Richard



