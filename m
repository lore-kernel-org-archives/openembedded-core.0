Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SU3T8-0006SV-To
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:10:19 +0200
Received: by ggnp4 with SMTP id p4so1186253ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GtHXmSKVfLJxQeswjCIKdGDRGAZ8+N8qspCL2oUabTE=;
	b=Gngu4Iv6KJP0fgquvDXHFTBZVi1VCtw6yv/sO8YJ0Vp38iDVJtdSB49AsNE5sCh9ga
	0AzaszRR+Rrj+pReqvLEjUAXoLAGIbF6At3+lc7awg2HMTGZUFPTY5+yEvFAB/2EuD0k
	KJ0np2xhmQyl6Dx7oBQian8+pvlONdJLMB1NdKxqaqXSyRFCfTftEWJhKBtTVyw1xWTm
	0RlMJNANAMo0qFd/tNyv7F3oXlQ+6CWjsWIm8n0i12ys16clw3xdcTaq2PQH4U8jhU1c
	sARoJJnlVuJ/pf38WbE/ESSNJRvkSuOI6w+oKXfAPUAsHt144IwtRY9NOxS7GVfryAfz
	sbtg==
MIME-Version: 1.0
Received: by 10.50.104.133 with SMTP id ge5mr493837igb.21.1337032818853; Mon,
	14 May 2012 15:00:18 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Mon, 14 May 2012 15:00:18 -0700 (PDT)
In-Reply-To: <4FB17205.3000207@windriver.com>
References: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
	<CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
	<4FB17205.3000207@windriver.com>
Date: Tue, 15 May 2012 01:00:18 +0300
Message-ID: <CAF6bG8dfHW9S4onZTEeWqHFT_sqpbpjJTSYZpOXZA+BsKQOq3Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: gracefully work with ccache environment variables
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
X-List-Received-Date: Mon, 14 May 2012 22:10:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

As you can see from my answer to last part I quote, I'm not against
your patch, so don't read first parts of this email with that mindset.
They are more generic discussion about ccache caches.

On 14 May 2012 23:58, Jason Wessel <jason.wessel@windriver.com> wrote:
>
> This is only an issue if the compiler has changed. =C2=A0In my case it is
> not changing, or at least it should be the same each time.

 Several years back ccache detected if compiler is the same by binary
size and timestamp, so compiler rebuild (with new timestamp) resulted
contents of the cache getting invalidated. They talked about changing
it to check md5sum of the compiler binary instead, but I haven't
followed if that's implemented already.

> =C2=A0I use one
> external ccache for all the embedded target work on a per build server
> basis and have done so for years for non-bitbake environments. =C2=A0I
> would like the same functionality from bitbake based builds.
>
> Right now with the external ccache my kernel compiles alone go from >
> 6 min down to < 30 seconds, so there is a definite desire on my side
> to have this work.

 Yes, I just wanted to make sure it works best way possible in every
possible use-case.

 Optimal results would come from using external (what I refer here as
my "normal" cache) cache for anything outside OpenEmbedded scope, and
for initial cross-compiler builds of OpenEmbedded (as that is done
with external compiler that will remain the same even when one does
complete rebuild), and second ("internal") cache for the rest of
OpenEmbedded build. Contents of latter gets invalid when one does full
rebuild, so it can be removed before one.
 I don't know, but assume that it would be a bit hard to select
correct one from two caches in OpenEmbedded builds (external one for
some builds, internal for others) so optimal realistic setup is that
user's normal external cache is not used at all inside OpenEmbedded.
Now, if user wants to override cache location (and thus create what
one may consider "external" cache) he should be allowed to do so, but
thing here is that the cache one uses normally does not get polluted
accidentally.

>> So you are proposing that user has to opt-out from that behavior (by
>> unsetting his normal CCACHE_DIR before running bitbake) and no
>> longer opt-in (by adding CCACHE_DIR to whitelist)
>
> The defaults remain the defaults, I am not changing anything to that
> end. =C2=A0I only aim to have configurability via the local.conf for
> various use cases surrounding ccache. =C2=A0As I mentioned before I'll ju=
st
> submit a new patch to add CCACHE_DIR to the hash whitelist so it is
> not in the ssatate sum. =C2=A0All the other problems were a result of pil=
ot
> error.

 Sorry, I earlier missed the "hash" part, and thought that you were
changing it so that OpenEmbedded would use external CCACHE_DIR unlike
before. That is: to change it to pollute my normal cache.


 - ML


