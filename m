Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tq7FA-0007IX-V1
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 20:11:21 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so13651865vbm.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LD9H7sr11l9ZXH30LzMTNYQ21tYIERdRfAEab2EFSVc=;
	b=XyypWT8ldzqrEjCGJaX/BfKVjgM42qcY4jpf+Xg3krOMRxbhOZOBP/47beDRt2mlL6
	fZ40EB6zioUaCtAvoav2CleO8HgHvhUkIUDc/JeH7dtJQECRq+LhPlTfsbMU0Lx2KXQ3
	eY6jZFjQHhearuiqImwHl+JFAaSNyWMy3vBOq3JrenT1FXz7oO6MbL0G+QmP5L/IKXvo
	l27lnip2qF89edULk4nml0Pe/x3FmLp+17wBYlDFvWGQizaN2vgzKvqrGgZYG2e8AmFc
	+60XwdHY+NHgYJooYZtMlo8TYpc7AB7qFKn92yKrjn7Zd9wzv60fInmUo5gpRTY8iQOm
	uYuQ==
MIME-Version: 1.0
Received: by 10.52.89.242 with SMTP id br18mr59792328vdb.22.1357066579446;
	Tue, 01 Jan 2013 10:56:19 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Tue, 1 Jan 2013 10:56:19 -0800 (PST)
In-Reply-To: <CAF6bG8fgx69uYhFVA2_SQSoEjnrRYAafaK6mHTt_TaDkcqOehw@mail.gmail.com>
References: <CAF6bG8fgx69uYhFVA2_SQSoEjnrRYAafaK6mHTt_TaDkcqOehw@mail.gmail.com>
Date: Tue, 1 Jan 2013 20:56:19 +0200
Message-ID: <CAF6bG8f1VHTXJzZbdm6wxh8OW_UKEEfDvwDN1MRVKZtH-2ay+g@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Automake 1.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jan 2013 19:11:21 -0000
Content-Type: text/plain; charset=UTF-8

On 1 January 2013 20:30, Marko Lindqvist <cazfi74@gmail.com> wrote:
> I did brief test of update automake in oe to new version 1.13 (and now
> to 1.13.1). First thing that failed (=prevented build to proceed to
> next one) was libtool-native. Error was in execution of "missing"
> script, so I guess these points from automake-1.13 NEWS are relevant:
>
> * Automatic remake rules and 'missing' script:
>
>   - The 'missing' script no longer tries to update the timestamp of
>     out-of-date files that require a maintainer-specific tool to be
>     remade, in case the user lacks such a tool (or has a too-old version
>     of it).  It just gives a useful warning, and in some cases also a
>     tip about how to obtain such a tool.

 Sorry for sending multiple separate mails - I sent previous when I
had made no progress for a while and assumed I would not have anything
more to say in a while. Then I got sudden revelation: Problem is in
fact recursive dependency. libtool-native depends on help2man-native,
though this dependency is not listed in recipe. Older versions of
automake worked despite that missing dependency; as stated above, it
just updated timestamp when help2man was not available. Now the
missing help2man causes it to abort (automake NEWS claim of *useful*
warning is not correct...) What makes this hard to fix is that
help2man depends on libtool in turn.


 - ML


