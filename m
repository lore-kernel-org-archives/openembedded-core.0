Return-Path: <jhovold@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D77057030B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 07:20:51 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ge10so91889lab.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 00:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gWn+E1dGp/SA04mRYDgMxHw/HOP1CSRQgERuj0N3UUM=;
	b=XYpdOMr+DEl3zC1a+csASBDqOXaAOb0Ms5ucmRiRiPmcO+nvVIkO2XO8tbkLFJ98FP
	1CIJ83hS7+EyiH/8NcNT2MF3MqyFpY0WONh5Jc4JJB4731YNGadFrFcH5UzWtmxK/mHM
	XKgtTydcii8SY+jr8JQPxPPQGojeccs1fPj0jqxKfHXCNFjj1jTMIUF3gzssOnOPMbU9
	bLgNZPWWdO6zpLRhCqYcfLmfyrGL2+JtY9VR/8k7PzahEHcovR+AMCQaFM8m40loob6G
	sK4q4+jzCW89rpLopEwda5bH1rFSXe5a7klrQwYZyKAs8aZV2YvtO8yF/2lXNdfoOnEk
	zb7Q==
X-Received: by 10.112.140.5 with SMTP id rc5mr2218633lbb.32.1414394450785;
	Mon, 27 Oct 2014 00:20:50 -0700 (PDT)
Received: from xi.terra (s83-177-171-8.cust.tele2.se. [83.177.171.8])
	by mx.google.com with ESMTPSA id lm4sm195394lac.35.2014.10.27.00.20.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Oct 2014 00:20:49 -0700 (PDT)
Sender: Johan Hovold <jhovold@gmail.com>
Received: from johan by xi.terra with local (Exim 4.84)
	(envelope-from <johan@kernel.org>)
	id 1XieYe-0005Id-LH; Mon, 27 Oct 2014 08:17:41 +0100
Date: Mon, 27 Oct 2014 08:17:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20141027071740.GA2006@localhost>
References: <1414352182-30029-1-git-send-email-paul@paulbarker.me.uk>
	<CANyK_8cVn-EuWaFT3KsAOKP_QoKwcGxE7QSqFNHoe6mQERRcdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8cVn-EuWaFT3KsAOKP_QoKwcGxE7QSqFNHoe6mQERRcdA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: OE Core <openembedded-core@lists.openembedded.org>,
	Chris Carr <chris.carr@ge.com>
Subject: Re: [PATCH] package_manager: Fix BAD_RECOMMENDATIONS for opkg
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
X-List-Received-Date: Mon, 27 Oct 2014 07:20:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 26, 2014 at 07:37:19PM +0000, Paul Barker wrote:
> On 26 October 2014 19:36, Paul Barker <paul@paulbarker.me.uk> wrote:
> > In package_manager.py, when using opkg as the packager, the command 'opkg <args>
> > info <pkg>' is called to get information about each pkg in BAD_RECOMMENDATIONS
> > in a format that can be written to the status file. The 'Status: ...' line is
> > modified and all other lines are passed through. Changing the verbosity level
> > argument for this command will change what it written into the status file.
> > Crucially, with the default verbosity level, no blank lines are being printed by
> > the opkg command and so no blank lines are being written to the status file to
> > separate each package entry.
> >
> > The package parsing code in opkg expects package entries in the status file to
> > be separated by at least one blank line. If no blank line is seen, the next
> > package entry is interpreted as a continuation of the last package entry, but
> > the new values overwrite the old values.
> >
> > So with the default verbosity level, a blank line follows some package entries
> > and these are parsed. The others are dropped due to the lack of blank lines. As
> > the verbosity increases, more debugging messages add blank lines and more
> > packages are parsed.

I was bitten by this after a recent update to Yocto 1.6.1. Only one of
two bad recommendations would be held back and the order of the entries
would affect which package was installed.

Adding two more entries to BAD_RECOMMENDATIONS still only prevented one
of the packages from being installed.

I had a chance to look into this briefly last Friday, and could conclude
that all four entries ended up in the status file, but that only one
remained after the language packages had been installed (first run of
opkg).

> > The solution to ensure that this works correctly regardless of the verbosity
> > level is simply add a blank line after the output of 'opkg info' is written to
> > the status file, ensuring that the next package is separated from the current
> > package.
> >
> > [YOCTO #6816]
> >
> > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > Cc: Chris Carr <chris.carr@ge.com>

I just verified that this patch fixes the problem, so feel free to add:

Tested-by: Johan Hovold <johan@kernel.org>

Thanks,
Johan

> > ---
> >  meta/lib/oe/package_manager.py | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> > index ffb83b2..85d7fd4 100644
> > --- a/meta/lib/oe/package_manager.py
> > +++ b/meta/lib/oe/package_manager.py
> > @@ -1408,6 +1408,10 @@ class OpkgPM(PackageManager):
> >                      else:
> >                          status.write(line + "\n")
> >
> > +                # Append a blank line after each package entry to ensure that it
> > +                # is separated from the following entry
> > +                status.write("\n")
> > +
> >      '''
> >      The following function dummy installs pkgs and returns the log of output.
> >      '''
> > --
> > 2.1.2
> >
> 
> Chris, could you give this a test and let us know if it fixes the issue.
> 
> Thanks,

