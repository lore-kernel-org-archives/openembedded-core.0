Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8DD739E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 19:45:37 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so54901568iec.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 12:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=tJuNpw+P2ky6HiH9jSEPD26ACHztsGSu6FsPy6GayOk=;
	b=GPBOl8X+/HlSa4CaAM7TJq+M+KAJs5FVjRi+OPp2btp6e1v/L4q+qdvAKpGWzSwbxJ
	dHzjwgrmNVd7f7zbRYBeN3sJQjVeSwFWA/L4m9ccnaZrP6yIB8cR3X/43a9Y41fHLtXD
	WmZtb2nsd6fcVM5Yyu0ueG+ofpXCEfLmGV29CSYoboGG8u//sjGis/P4ERWl/h/VsTdP
	ikun7OYmh5gdvt6/6ypbaXqU9P6yFH0DXo0r7xvl6nu4eGkeOHlaX5tSOLFmwXywzmvn
	PEPXuDXqGlrgwuWnVD/Lw33JuWJNjZJzSxjVJC5sQrChvJ0c5jHv5fv8TYEttJH+M+Zn
	5KrQ==
X-Gm-Message-State: ALoCoQma7iyrcY9biTNiU3V9v9n5QWeBxebfiefcNxx5r1GBoBbpwGTofqOkquV/q1opLMYSR4sU
X-Received: by 10.42.249.20 with SMTP id mi20mr50971991icb.86.1426189536801;
	Thu, 12 Mar 2015 12:45:36 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F518.dip0.t-ipconnect.de. [93.232.245.24])
	by mx.google.com with ESMTPSA id n15sm4986832ioe.6.2015.03.12.12.45.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 12:45:35 -0700 (PDT)
Message-ID: <1426189532.3602.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 12 Mar 2015 20:45:32 +0100
In-Reply-To: <1687842.XY6UoZ3apI@peggleto-mobl5.ger.corp.intel.com>
References: <1425905799-9101-1-git-send-email-patrick.ohly@intel.com>
	<1687842.XY6UoZ3apI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Thu, 12 Mar 2015 19:45:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-03-12 at 18:21 +0000, Paul Eggleton wrote:
> Hi Patrick,
> 
> On Monday 09 March 2015 13:56:39 Patrick Ohly wrote:
> > +# global options
> > +[DEFAULT]
> > +
> > +# Add 'Signed-off-by' to all commits that get imported automatically.
> > +signoff = True
> > +
> >  # component name
> >  [bitbake]
> >  # mandatory options
> 
> So I'm OK with adding this in as an option. However to me a name like DEFAULT 
> implies you're establishing a general section to apply default settings for 
> all components where the component can override those defaults if it chooses, 
> which doesn't really represent what this does - so a different name might be 
> more appropriate (GLOBAL or _global_ perhaps?)

"DEFAULT" is the special string that Python's ConfigParser uses, well,
by default for that special section which does not show up in the list
of sections. I don't know how to rename that.

I'm probably abusing this concept a bit here: it seems that special
section is meant to provide default values that get returned also for
the other sections when they don't have their own value.

Here's a cleaner solution:
      * Get rid of the [DEFAULT] section in the file.
      * When reading it, on-the-fly prepend the string
        '[this-is-not-really-a-repo'].
      * When reading global properties, get it from that section.
      * When listing sections to find repos, ignore it.

How about that?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




