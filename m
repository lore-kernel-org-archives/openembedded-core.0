Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 22D1177016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:23:05 +0000 (UTC)
Received: by iofh134 with SMTP id h134so14525418iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=ByMktj7vbqqwtW5KhAYfMrDF0duZ/58t/snhYW+iiRg=;
	b=AeJgbY0gn1D5OmxR0U+pcPyEHzuEJZzXXhtsveG9DNUOBvnYd13SZdYzIBNgmfIJYX
	PDqdGa0zsKR701RgzhMfyVtPaLHPy+o5gp3T1dzTtqQUCngPpFDyW8QAZRxl1vAut+Wy
	DX+O6S7Cbsgyb+ueSIfLTyFbl5SmDXpiF0w/rMhye5agMtmKMdrlzTdPwxf69mIDvSNL
	zP9dHREc67rSXWbjrEP5ipdyidOlE60dO7GUdQasPmpbBCdOpEp5LcFqVWS2dWEwDTBW
	4SToeap5GdNGJtmxXA+CFIO/tUPhfmV78FUqUjnk2joXvJkVNrOzil4kPVV+4kOrQLIp
	nrZw==
X-Gm-Message-State: ALoCoQkunsUAhXTeYo4GDfkZGpW9SlSqdQebGgCPsIHaOQylMDaVC8WIPcOcW6wlodSJgOI9extm
X-Received: by 10.107.30.13 with SMTP id e13mr4178750ioe.57.1441351385915;
	Fri, 04 Sep 2015 00:23:05 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB6C.dip0.t-ipconnect.de. [93.232.251.108])
	by smtp.gmail.com with ESMTPSA id
	os9sm1021587igb.11.2015.09.04.00.23.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 00:23:05 -0700 (PDT)
Message-ID: <1441351382.9573.50.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Date: Fri, 04 Sep 2015 09:23:02 +0200
In-Reply-To: <1441351029.9573.47.camel@intel.com>
References: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441351029.9573.47.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Fri, 04 Sep 2015 07:23:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2015-09-04 at 09:17 +0200, Patrick Ohly wrote:
> On Thu, 2015-09-03 at 16:56 -0500, Alex Franco wrote:
> > Removing recursive option from chmod -st on BUILDDIR as it would
> > take very long on existing build directories
> 
> Okay, so this *is* a problem others are also seeing ;-}
> 
> > diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> > index f5b7e4e..91bd86b 100755
> > --- a/scripts/oe-setup-builddir
> > +++ b/scripts/oe-setup-builddir
> > @@ -24,7 +24,10 @@ if [ -z "$BUILDDIR" ]; then
> >  fi
> >  
> >  mkdir -p "$BUILDDIR/conf"
> > -chmod -R -st "$BUILDDIR" 
> > +
> > +# Attempting removal of sticky,setuid bits from BUILDDIR, BUILDDIR/conf
> > +chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
> > +chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR/conf"
> >  
> >  if [ ! -d "$BUILDDIR" ]; then
> >      echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
> 
> What was the reasoning behind adding these operations on $BUILDDIR/conf
> before the check whether BUILDDIR exists and is a directory? Looks a bit
> fishy to me.

Non-existent parent of $BUILDDIR is caught elsewhere, but pointing
BUILDDIR to a file instead of a directory indeed leads to sub-optimal
error reporting:

$ touch /tmp/foobar
$ . oe-init-build-env /tmp/foobar
mkdir: cannot create directory ‘/tmp/foobar’: Not a directory
chmod: cannot access ‘/tmp/foobar/conf’: Not a directory
Error: The builddir (/tmp/foobar) does not exist!

Not sure whether it's worth fixing, though. Better get this performance
fix included quickly.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




