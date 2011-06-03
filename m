Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <640e9920@gmail.com>) id 1QSVWg-0000eq-Ph
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 16:39:02 +0200
Received: by pwj9 with SMTP id 9so1071941pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/LhIZC3u9MAQ/zBadXWML9K4oILjbX/g6+bqKf2JX1E=;
	b=WsQlXLJ0Oc8B8BXSKLACu8gE1xttEAbyK92bxPHnwsJzwN+rMW2OQ9LRxwgum9TbuC
	A/XLOhZJdbqV7+SzVwWB/dEZuA/AeI1JNo69A4znIX4aZ7HcNGbbB6PqYHLCqthcZ12N
	lgjDRGY7/q0FR2oxPZgFpgwQfXZU8JEKDJjQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:subject:message-id:reply-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=UipZdSfM7ZjNu3LIo2TjSnp6BdE/rgC1lNiFWaX8N+YjBik1xiE1EQEBbIKX6WcasG
	qrQCJu4DO1DzhQgljlmpMDa0+QsygqVGcu0dEal0AxgzxvnYV0kcnDbtCjJYG8KY3Awa
	ljFXArWzswETc6iOHBzl5lao1jam36nSmHNAc=
Received: by 10.68.36.194 with SMTP id s2mr775706pbj.119.1307111748392;
	Fri, 03 Jun 2011 07:35:48 -0700 (PDT)
Received: from localhost (c-24-22-115-171.hsd1.or.comcast.net [24.22.115.171])
	by mx.google.com with ESMTPS id w2sm1510301pbg.5.2011.06.03.07.35.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Jun 2011 07:35:47 -0700 (PDT)
Sender: mgross <640e9920@gmail.com>
Date: Fri, 3 Jun 2011 07:35:45 -0700
From: mark gross <markgross@thegnar.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110603143545.GB27754@gvim.org>
References: <4DE56B0D.4020209@intel.com>
	<1306940803.2529.101.camel@phil-desktop>
	<1306945558.27470.435.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1306945558.27470.435.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Tell me your build error message annoyances!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: markgross@thegnar.org,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 03 Jun 2011 14:39:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 01, 2011 at 05:25:58PM +0100, Richard Purdie wrote:
> On Wed, 2011-06-01 at 16:06 +0100, Phil Blundell wrote:
> > On Tue, 2011-05-31 at 15:26 -0700, Scott Garman wrote:
> > > I'd like to collect some feedback on error messages while building that 
> > > you find confusing/annoying/unhelpful. I'm going to be working on trying 
> > > to improve the situation and would like to hear from you about what 
> > > could be more helpful.
> > 
> > Funnily enough we were just having a discussion about this on irc.  My
> > personal top two least favourite diagnostics are:
> > 
> > a) "bitbake -b nonexistent-file" gives ten lines of so of python
> > exception traceback and then prints "MultipleMatches".
> > 
> > b) "bitbake -b recipe.bb", with a recipe that skips (due to an
> > inCOMPATIBLE_MACHINE or whatever) gives the traditional ten lines of
> > traceback spew and then prints "TypeError: 'NoneType' object is not
> > iterable".
> > 
> > This is with bitbake 1.13.0.
> 
> Agreed, these are issues.
> 
> I'd like to highlight that there is an underlying design issue in
> bitbake which make these hard issues to fix. Its very hard for bitbake
> to work out when it needs to show the traceback and when it doesn't.
> 
> If the user has been given an explanation of the problem we shouldn't
> show the traceback but its hard to know that is the case.
> 
> Somehow we therefore need to improve the error infrastructure in bitbake
> to be able to tell the difference between an unexpected error where a
> traceback is useful and a known error which has been explained to the
> user and no traceback is required.

Well perhaps it would be easier to build a list of packages that have
been skipped?  I think the cache knows about them.  Perhaps they could
be reported to a "skipped" file or something similar?

--mark



