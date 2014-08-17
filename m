Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9896FC4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8tPZi019030; Sun, 17 Aug 2014 09:55:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zkGBmCJGRxfw; Sun, 17 Aug 2014 09:55:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8tKba019027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 17 Aug 2014 09:55:21 +0100
Message-ID: <1408265720.24858.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>
Date: Sun, 17 Aug 2014 09:55:20 +0100
In-Reply-To: <CAPbeDCnE1f7Hcu7OpHWJFE=Jr6-_P7eowweAMvV2Cm0wvBCHNA@mail.gmail.com>
References: <1406969694.6981.22.camel@ted>
	<CAPbeDCnE1f7Hcu7OpHWJFE=Jr6-_P7eowweAMvV2Cm0wvBCHNA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] pixbufcache: Use sceneQueueComplete event to simplify usage
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
X-List-Received-Date: Sun, 17 Aug 2014 08:55:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-08-17 at 10:33 +0200, Jacob Kroon wrote:
> On Sat, Aug 2, 2014 at 10:54 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         [This is an RFC which depends on a patch to bitbake to
>         operate]
>         
>         Currently, we have a mess of dependencies for pixbufcache and
>         even then
>         it breaks since they might be controlled by PACKAGECONFIG.
>         
>         Instead, this patch proposes an alternative approach where we
>         allow
>         "fixups" from a sceneQueueComplete() event at the end of the
>         setscene
>         process. We signal the need for these using simply stamp
>         files.
>         
>         The one downside is that the processing code needs to be in a
>         global
>         event handler like base.bbclass rather than
>         pixbufcache.bbclass but this
>         is probably a price worth paying to avoid the dependency mess?
>         
>         Signed-off-by: Richard Purdie
>         <richard.purdie@linuxfoundation.org>
>         
> 
> 
> Instead of having the sstate_postinst() touch "needpixbuf", could we
> make it write out the actual script that needs to be executed ?
> 
> Then base.bbclass could iterate over any scripts installed by any
> sstate_postinst() and execute them. At least this would better isolate
> the pixbuf-code to pixbufcache.bbclass, and make the snippet in
> base.bbclass more generic.

It does become trickier to avoid races when writing out that script.
Touching the file is rather easy from a lock perspective :)

Cheers,

Richard




