Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-07.prod.phx3.secureserver.net
	(p3plsmtpa08-07.prod.phx3.secureserver.net [173.201.193.108])
	by mail.openembedded.org (Postfix) with ESMTP id 6949260167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 22:29:30 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-07.prod.phx3.secureserver.net with 
	id 2mVS1p00b0BVjqb01mVTeC; Mon, 13 Oct 2014 15:29:31 -0700
Message-ID: <543C5246.30703@pabigot.com>
Date: Mon, 13 Oct 2014 17:29:26 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
	<20141013162851.58e820e6@e6410-2>
In-Reply-To: <20141013162851.58e820e6@e6410-2>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] pseudo+image.bbclass: changes to avoid host contamination
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
X-List-Received-Date: Mon, 13 Oct 2014 22:29:37 -0000
Content-Type: multipart/alternative;
	boundary="------------070400090704020407030406"

--------------070400090704020407030406
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2014 04:28 PM, Peter Seebach wrote:
> On Sun, 12 Oct 2014 18:49:52 -0500
> "Peter A. Bigot" <pab@pabigot.com> wrote:
>
>> I believe OE should add --without-passwd-fallback to the pseudo 1.6.2
>> configuration flags early in the 1.8 development cycle, to ensure there
>> are no host contamination issues.  I can think of no reason why the
>> build host passwd and group files should ever be considered suitable for
>> use in determining target user/group characteristics.
> I endorse this evaluation.
>
> I've been thinking about this more, and I'd like to wave a thought at people:
>
> I propose for consideration the idea that pseudo have a compile-time
> hard-coded default answer to "what is uid 0" and "what is gid 0", and use
> that instead of the "fallback path".
>
> The rationale is basically: Yes, it's a special case. But it's *the* special
> case. It's the special case that is the uid pseudo emulates by default, and
> it's the only one that most packages ever need. If we do this, then the only
> packages which need to depend on base-passwd are those which need to actually
> use a *non-root* uid/gid. And every such package had better already have
> a dependency either directly on the passwd stuff, or on some other package
> which does.


As I noted in an off-list message:

    The thing that worries me is the slippery slope of assumptions.
    Sure, assume that pw_name for uid 0 is "root". *Probably* pw_gid is
    0, but is that required by some standard?  pw_dir could be "/" or
    "/home/root"; which one?  "/bin/sh"?  Not on Ubuntu.  pw_gecos?
    Guesses can be made for all those, but for many there might be a
    legitimate reason why the actual final passwd file on the target
    selects different values, and decisions made based on the guesses
    might result in very difficult to diagnose inconsistencies.


Basically, even if "root" is a special case, taking this path means 
making assumptions about what the application is doing based on what 
system/libc functions it invokes.  Too often when somebody assumes a 
general tool will only be used specific ways, somebody else will prove 
them wrong.

I can't say it won't turn out to be the best approach, but I'd like to 
see some thought applied to how the dependency on base-passwd might be 
added without modifying every recipe.  E.g., something like:

DEPENDS_INSTALL ?= "base-passd:do_populate_sysroot"
d.appendVarFlag('do_install', 'depends', d.expand(' ${DEPENDS_INSTALL}'))

down in base.bbclass.  (Or whatever is necessary to get the intent of 
that snippet.)

> I am pretty sure that this makes more sense than the default fallback to
> host passwd/group. I might want to preserve the option of that fallback, but
> make it a non-default.
>
> Anyone have strong feelings on this? Thoughts I may not have thought through
> yet? I don't know that I actually had a coherent reason in mind for the
> original fallback behavior, and this analysis convinces me that falling back
> to host uid/gid is probably wrong for many-to-most use cases.
>
> I guess it might make sense for something more like a debian package build
> where you really are targeting the host, but even then, I am not sure that the
> default host fallback is a good idea.

I can't offhand think of a reason host fallback would be necessary, but 
since it already exists keeping it as a non-default option is maybe 
worthwhile (see "assumptions" above).

Note that with my enhancement you should be able to do:

PSEUDO_PASSWD = "${STAGING_DIR_TARGET}:"

and get the host files, but that's not a fixed fallback that's always 
available regardless of invocation options.

Peter

--------------070400090704020407030406
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/13/2014 04:28 PM, Peter Seebach
      wrote:<br>
    </div>
    <blockquote cite="mid:20141013162851.58e820e6@e6410-2" type="cite">
      <pre wrap="">On Sun, 12 Oct 2014 18:49:52 -0500
"Peter A. Bigot" <a class="moz-txt-link-rfc2396E" href="mailto:pab@pabigot.com">&lt;pab@pabigot.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">I believe OE should add --without-passwd-fallback to the pseudo 1.6.2
configuration flags early in the 1.8 development cycle, to ensure there
are no host contamination issues.  I can think of no reason why the
build host passwd and group files should ever be considered suitable for
use in determining target user/group characteristics.
</pre>
      </blockquote>
      <pre wrap="">
I endorse this evaluation.

I've been thinking about this more, and I'd like to wave a thought at people:

I propose for consideration the idea that pseudo have a compile-time
hard-coded default answer to "what is uid 0" and "what is gid 0", and use
that instead of the "fallback path".

The rationale is basically: Yes, it's a special case. But it's *the* special
case. It's the special case that is the uid pseudo emulates by default, and
it's the only one that most packages ever need. If we do this, then the only
packages which need to depend on base-passwd are those which need to actually
use a *non-root* uid/gid. And every such package had better already have
a dependency either directly on the passwd stuff, or on some other package
which does.</pre>
    </blockquote>
    <br>
    <br>
    As I noted in an off-list message:<br>
    <br>
    <blockquote>
      The thing that worries me is the slippery slope of assumptions.
      Sure, assume that pw_name for uid 0 is "root".  <b
        class="moz-txt-star"><span class="moz-txt-tag">*</span>Probably<span
          class="moz-txt-tag">*</span></b> pw_gid is 0, but is that
      required by some standard?  pw_dir could be "/" or "/home/root";
      which one?  "/bin/sh"?  Not on Ubuntu.  pw_gecos? Guesses can be
      made for all those, but for many there might be a legitimate
      reason why the actual final passwd file on the target selects
      different values, and decisions made based on the guesses might
      result in very difficult to diagnose inconsistencies.
      <br>
    </blockquote>
    <br>
    Basically, even if "root" is a special case, taking this path means
    making assumptions about what the application is doing based on what
    system/libc functions it invokes.  Too often when somebody assumes a
    general tool will only be used specific ways, somebody else will
    prove them wrong.<br>
    <br>
    I can't say it won't turn out to be the best approach, but I'd like
    to see some thought applied to how the dependency on base-passwd
    might be added without modifying every recipe.  E.g., something
    like:<br>
    <br>
    DEPENDS_INSTALL ?= "base-passd:do_populate_sysroot"<br>
    d.appendVarFlag('do_install', 'depends', d.expand('
    ${DEPENDS_INSTALL}'))<br>
    <br>
    down in base.bbclass.  (Or whatever is necessary to get the intent
    of that snippet.)<br>
    <br>
    <blockquote cite="mid:20141013162851.58e820e6@e6410-2" type="cite">
      <pre wrap="">I am pretty sure that this makes more sense than the default fallback to
host passwd/group. I might want to preserve the option of that fallback, but
make it a non-default.

Anyone have strong feelings on this? Thoughts I may not have thought through
yet? I don't know that I actually had a coherent reason in mind for the
original fallback behavior, and this analysis convinces me that falling back
to host uid/gid is probably wrong for many-to-most use cases.

I guess it might make sense for something more like a debian package build
where you really are targeting the host, but even then, I am not sure that the
default host fallback is a good idea.</pre>
    </blockquote>
    <br>
    I can't offhand think of a reason host fallback would be necessary,
    but since it already exists keeping it as a non-default option is
    maybe worthwhile (see "assumptions" above).<br>
    <br>
    Note that with my enhancement you should be able to do:<br>
    <br>
    PSEUDO_PASSWD = "${STAGING_DIR_TARGET}:"<br>
    <br>
    and get the host files, but that's not a fixed fallback that's
    always available regardless of invocation options.<br>
    <br>
    Peter<br>
  </body>
</html>

--------------070400090704020407030406--
