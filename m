Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 207A477020
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 06:37:00 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so32328037igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 23:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=DLVaizvMfXwhjZfkauzyI3RG+SwuUt74a1eQ2yiC7Xk=;
	b=IO9I1W45KEWXMLxarRTTkPS8qLwEQQh2rutik3Md//kGazkS30mEYpdumq4+SPhBFN
	NbLE+qGsvJNB1XNJCMDG0YRyyY/PhSL8qXAdfx96WrgVeoFOWSia48WfGD7Bxtyc4Qcv
	CjD0jQo18o8GR7L6ZrfLVEnPJjw7DFhwd+wEJqqV/k4zNxWkaay4X/iyV7RE3o16qKF5
	NykDBEikJsH7f/E9YPXSj3Q8uw/2KnAF6JGEvQmkRgw9uMQYMt80WeCaPb73GFFRxoru
	uOJ5IEM9Tw0QtGw5brOnWOE1iTRQp9pCMSnOYjARi6TCdxotlyKEyKt5tNm19AnFafQY
	CpDA==
X-Gm-Message-State: ALoCoQm6pdaqztOBkF02X+iCv0sMws76vKLiBlCF0LvPRMjQgV70o3kFtbp7hCV2hYhg3cIhRpvk
X-Received: by 10.50.67.3 with SMTP id j3mr9812817igt.70.1441262220528;
	Wed, 02 Sep 2015 23:37:00 -0700 (PDT)
Received: from pohly-mobl1 (p57A5686C.dip0.t-ipconnect.de. [87.165.104.108])
	by smtp.gmail.com with ESMTPSA id r4sm3945092igh.14.2015.09.02.23.36.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 23:37:00 -0700 (PDT)
Message-ID: <1441262218.9573.12.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 03 Sep 2015 08:36:58 +0200
In-Reply-To: <CAP9ODKrCzcUdfs9+GLsSe-ztS3c5BCmcLBPdmSayw-y9ZzPtkA@mail.gmail.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<e0cab1af2f3fa08d0a4d202c65fae83a927e1567.1441207840.git.patrick.ohly@intel.com>
	<CAP9ODKrCzcUdfs9+GLsSe-ztS3c5BCmcLBPdmSayw-y9ZzPtkA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] initramfs-framework: add separate init_verbose log level parameter
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
X-List-Received-Date: Thu, 03 Sep 2015 06:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 13:16 -0300, Otavio Salvador wrote:
> On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Using the general purpose "debug" and "verbose" kernel parameters to
> > increase logging in the init script has the disadvantage that it
> > also increases logging in other components, making the output hard
> > to read (in particular with "debug").
> >
> > The new init_verbose parameter only affects the init script:
> >   init_verbose, init_verbose=1, init_verbose=true: enable just some info messages
> >   init_verbose=2: debug messages
> >
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > ---
> >  meta/recipes-core/initrdscripts/initramfs-framework/init | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
> > index e8f4713..cd55ee2 100755
> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> > @@ -14,6 +14,13 @@
> >  # 'foo=value' as 'bootparam_foo=value'
> >  # 'foo' as 'bootparam_foo=true'
> >  # 'foo.bar[=value] as 'foo_bar=[value|true]'
> > +#
> > +# Special boot parameters always recognized by initramfs-framework (see modules
> > +# like "debug" for additional ones):
> > +# debug: enable debug logging (beware, also enables debug output in other system components)
> > +# verbose: similar do debug, just less output
> > +# init_verbose[=true|1|2]: same output as for verbose when no value or true/1 are given,
> > +#                          same as debug for 2 - only affects logging in initramfs-framework
> 
> I personally don't see much benefit on this. The debug module is the
> one used to debug the initramfs-framework script. If we ought to add
> support for something like this, this should be done there.

So you are saying that the msg/info/debug/fatal functions should be in
the "debug" module? Or should they be present, but changing the logging
level should be done by the "debug" module? How would logging work
before the "debug" module is loaded or when it is not installed at all
(as in a production image)?

I guess one could have empty stubs in the main "init" and only do
logging after loading the debug module - that should work, at the loss
of early log output.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




