Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 44ECF612D1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2013 16:25:21 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1Vd0UM-000N4n-OS; Sun, 03 Nov 2013 16:25:23 +0000
Received: from [192.168.0.83] ([192.168.0.83]) (authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	rA3GPHUo012338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Sun, 3 Nov 2013 10:25:18 -0600
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1+zsITPp7PmWgtkgXmfzA7lxnWzTceEpqk=
Message-ID: <1383495917.6158.30.camel@omclinuxballt.devnet.ordermatic.net>
From: Brian Lloyd <blloyd@familyhonor.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 03 Nov 2013 10:25:17 -0600
In-Reply-To: <CAMKF1sox9M+4v72sCWQafa0wWjLQMo5bgEYc4AEmRLxArS2uTg@mail.gmail.com>
References: <cover.1383197850.git.blloyd@familyhonor.net>
	<2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
	<CAJTo0LbjScOrHHBW5HK_WcOCnYabRvwP2CnYpHuSDJGxVqny3Q@mail.gmail.com>
	<CAMKF1sox9M+4v72sCWQafa0wWjLQMo5bgEYc4AEmRLxArS2uTg@mail.gmail.com>
X-Mailer: Evolution 3.6.4 (3.6.4-3.fc18) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Sun, 03 Nov 2013 16:25:22 -0000
Content-Type: multipart/alternative; boundary="=-aX+xMFtT/SM4DZXusnri"

--=-aX+xMFtT/SM4DZXusnri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thank you for the interest.

Personally, I wouldn't mind just adding gcore to the base package, as it
isn't very large.  However, it really is a support script that isn't
necessary for gdb or gdb-server.  It does make testing the other part of
the patch easier, though.  But as it isn't strictly necessary, I opted
to let people opt in or out of having it.
I am hoping in the future there will be a way to view available packages
so end users can browse a list and add things without having to have
pre-knowledge that it exists to go looking for it.

I do not think the -dbg symbols should be a requirement of the gcore
package.  It wasn't while using gcore that I found the missing
dependency, but actually trying to analyze crash dumps created with gdb
installed on the device and a segfaulting multi-threaded program.  All
core files produced would have no more than one usable thread's data in
it, and it never seemed to be from the crashing thread.  OS level crash
dumps and gdb debugging of the application both were not properly
functional until those symbols were placed on the device, after which
both worked.  Therefore, it seems appropriate to place the dependency
against the gdb package as it fixes a defect with the program installed
by that package.  While I haven't been using gdb-server on the device,
the research I did pointed to that program also needing those symbols,
so the dependency was added there too.

As I have never used a system that didn't have gdb installed, I am not
sure whether core dumps can be generated without the debugger installed.
If they can, perhaps the eglibc package itself should be made NO_STRIP
or else eglibc made to recommend it's own debug symbols.  I don't really
like the no strip idea, as stripped binaries are smaller and thus faster
to load and these symbols are not needed very often, so why force them
to be loaded all the time, but it is an option.



As far as testing this, I could make a small multi-threaded application
that intentionally dereferences a null pointer in one of 4 threads
spawned.  That can show the broken nature of gdb core generation without
the thread library symbols.  If this is needed, I will put one together
and just reply here that it can be pulled from the poky-contrib
repository.  I found and resolved the problem while working on a project
my company is not yet ready to release.

However, if you just want to see that gdb doesn't handle threads
properly, you can just pick a multi-threaded program, do a core dump
(the gcore script makes this trivial), and then load the core file in a
debugger on the development system.  Even though the development system
has the symbols, that core won't be readable except for one thread.

 
I will do another patch fixing the commit message and incorporating
improvements we identify during this discussion.

Brian


On Fri, 2013-11-01 at 09:32 -0700, Khem Raj wrote:

> 
> 
> On Friday, November 1, 2013, Burton, Ross wrote:
> 
>         On 31 October 2013 06:54, blloyd <blloyd@familyhonor.net>
>         wrote:
>         > +FILES_gcore = "${bindir}/gcore"
>         
>         Why can't this script just be added to the gdb package?
>         
> 
> 
> actually if we have it as a separate package then all those new
> rrcommends baggage can be added to gcore package instead of gdb proper
>  
>         
>         
>         Ross
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=-aX+xMFtT/SM4DZXusnri
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.4">
</HEAD>
<BODY>
Thank you for the interest.<BR>
<BR>
Personally, I wouldn't mind just adding gcore to the base package, as it isn't very large.&nbsp; However, it really is a support script that isn't necessary for gdb or gdb-server.&nbsp; It does make testing the other part of the patch easier, though.&nbsp; But as it isn't strictly necessary, I opted to let people opt in or out of having it.<BR>
I am hoping in the future there will be a way to view available packages so end users can browse a list and add things without having to have pre-knowledge that it exists to go looking for it.<BR>
<BR>
I do not think the -dbg symbols should be a requirement of the gcore package.&nbsp; It wasn't while using gcore that I found the missing dependency, but actually trying to analyze crash dumps created with gdb installed on the device and a segfaulting multi-threaded program.&nbsp; All core files produced would have no more than one usable thread's data in it, and it never seemed to be from the crashing thread.&nbsp; OS level crash dumps and gdb debugging of the application both were not properly functional until those symbols were placed on the device, after which both worked.&nbsp; Therefore, it seems appropriate to place the dependency against the gdb package as it fixes a defect with the program installed by that package.&nbsp; While I haven't been using gdb-server on the device, the research I did pointed to that program also needing those symbols, so the dependency was added there too.<BR>
<BR>
As I have never used a system that didn't have gdb installed, I am not sure whether core dumps can be generated without the debugger installed.&nbsp;&nbsp; If they can, perhaps the eglibc package itself should be made NO_STRIP or else eglibc made to recommend it's own debug symbols.&nbsp; I don't really like the no strip idea, as stripped binaries are smaller and thus faster to load and these symbols are not needed very often, so why force them to be loaded all the time, but it is an option.<BR>
<BR>
<BR>
<BR>
As far as testing this, I could make a small multi-threaded application that intentionally dereferences a null pointer in one of 4 threads spawned.&nbsp; That can show the broken nature of gdb core generation without the thread library symbols.&nbsp; If this is needed, I will put one together and just reply here that it can be pulled from the poky-contrib repository.&nbsp; I found and resolved the problem while working on a project my company is not yet ready to release.<BR>
<BR>
However, if you just want to see that gdb doesn't handle threads properly, you can just pick a multi-threaded program, do a core dump (the gcore script makes this trivial), and then load the core file in a debugger on the development system.&nbsp; Even though the development system has the symbols, that core won't be readable except for one thread.<BR>
<BR>
 <BR>
I will do another patch fixing the commit message and incorporating improvements we identify during this discussion.<BR>
<BR>
Brian<BR>
<BR>
<BR>
On Fri, 2013-11-01 at 09:32 -0700, Khem Raj wrote:<BR>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
    On Friday, November 1, 2013, Burton, Ross wrote:<BR>
    <BLOCKQUOTE>
        On 31 October 2013 06:54, blloyd &lt;<A HREF="javascript:;">blloyd@familyhonor.net</A>&gt; wrote:<BR>
        &gt; +FILES_gcore = &quot;${bindir}/gcore&quot;<BR>
        <BR>
        Why can't this script just be added to the gdb package?
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    actually if we have it as a separate package then all those new rrcommends baggage can be added to gcore package instead of gdb proper
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    &nbsp;
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE>
        <BR>
        Ross<BR>
        _______________________________________________<BR>
        Openembedded-core mailing list<BR>
        <A HREF="javascript:;">Openembedded-core@lists.openembedded.org</A><BR>
        <A HREF="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</A><BR>
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BR>
</BODY>
</HTML>

--=-aX+xMFtT/SM4DZXusnri--
