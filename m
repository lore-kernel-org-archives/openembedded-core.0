Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id C53BC73223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:18:39 +0000 (UTC)
Received: by obcnx10 with SMTP id nx10so12791595obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=M4J0BLz3p8/PH/WcSwJN1R9Zddv34EOb2MVSJuPaZYo=;
	b=SAXEffc6cSmL/4REHCH/GuOtjXSTQySnn7MHxX82zmhgwd/wr4WBreLoisIYEC07Hq
	mhTpXEAGviijwlieq+T+8COEzBbi1P4dm5Nl8+zPZQlRBw9ODSKHTrsv3cNWq5zjoNFO
	lzkWDaoSTWn6HHE0e/o2blI9B/f6dMobqKZbtM3SVgvEe3mOGrAxGk+OdLZprj4VZEPj
	BLSVgv/bIRUOgRaywWfOZU2fDQpSV81GutURiSoYLLu6u1Y+j8aLzHGOQ6dt+/wQ9h6k
	8Qw27oK8DvJV4GjmYM2xAPvi7tgNOXFGIZdeDHQzKcEagw9sRUXHdHu1RR7f03YvtMQA
	OaXA==
MIME-Version: 1.0
X-Received: by 10.202.202.80 with SMTP id a77mr25688875oig.118.1432761520567; 
	Wed, 27 May 2015 14:18:40 -0700 (PDT)
Received: by 10.202.44.23 with HTTP; Wed, 27 May 2015 14:18:40 -0700 (PDT)
In-Reply-To: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
References: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 27 May 2015 14:18:40 -0700
Message-ID: <CAJ86T=VrHPQjvL+cedDcq0OQrZgbbf_CnE8C4Biq3j6wYj3f3A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] gnu-config: improve detection of perl setup errors
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
X-List-Received-Date: Wed, 27 May 2015 21:18:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 27, 2015 at 2:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Read 'autoconf --trace' output via a temp file to improve error detection.
>
> If the command's output is read via a pipe to Autom4te::XFile then perl
> setup errors (e.g. mixing host and OE perl libs) which cause the autoconf
> command to segfault may go undetected.
>
> Add a -k / --continue command line option to simulate the old behaviour.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---

This patch set needs the same warning as before:

Warning: This patch causes building of some packages to fail if OE and
host perl versions differ, so should not be merged until those issues
are resolved. To reproduce the current issues:

  - Use a host with perl 5.18 (e.g. Ubuntu 14.04)
  - Apply this patch to oe-core master or fido
  - bitbake -fc configure intltool


>  .../gnu-config/gnu-config/gnu-configize.in         | 32 +++++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in b/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
> index d4908fc..c3dcd74 100755
> --- a/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
> +++ b/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
> @@ -45,6 +45,7 @@ use Autom4te::General;
>  use Autom4te::XFile;
>  # Do not use Cwd::chdir, since it might hang.
>  use Cwd 'cwd';
> +use File::Temp qw/ tempfile /;
>  use strict;
>
>  ## ----------- ##
> @@ -64,6 +65,7 @@ Operation modes:
>    -V, --version            print version number, then exit
>    -v, --verbose            verbosely report processing
>    -f, --force              consider all files obsolete
> +  -k, --continue           ignore errors when running autoconf
>    -s, --symlink            install symbolic links instead of copies
>    -W, --warnings=CATEGORY  report the warnings falling in CATEGORY [syntax]
>
> @@ -86,6 +88,8 @@ my $configdir  = '@gnu-configdir@';
>  #'/home/kergoth/code/build-arm/tmp/staging/i686-linux/share/gnu-config';
>  my $autoconf   = $ENV{'AUTOCONF'}     || 'autoconf';
>
> +my $ignore_autoconf_errors = 0;
> +
>  # use symlinks instead.
>  my $symlink = 0;
>
> @@ -109,6 +113,7 @@ sub parse_args ()
>  {
>    my $srcdir;
>
> +  getopt ('k|continue'           => \$ignore_autoconf_errors);
>    getopt ('s|symlink'            => \$symlink);
>
>    # Even if the user specified a configure.ac, trim to get the
> @@ -152,16 +157,33 @@ sub gnu_configize_current_directory ()
>    my $dest;
>
>    verb "$configure_ac: tracing";
> -  my $traces = new Autom4te::XFile
> -    ("$autoconf"
> +
> +  my $autoconf_cmd = "$autoconf"
>       . join (' --trace=', '',
>              # If you change this list, update the
>              # `Autoreconf-preselections' section of autom4te.in.
>              'AC_CONFIG_AUX_DIR:AC_CONFIG_AUX_DIR:\$1',
>              'AC_CONFIG_SUBDIRS:AC_CONFIG_SUBDIRS:\$1',
>              'AC_INIT',
> -           )
> -     . ' |');
> +           );
> +
> +  # Read 'autoconf --trace' output via a temp file to improve error detection.
> +  # If the command's output is read via a pipe to Autom4te::XFile then perl
> +  # setup errors (e.g. mixing host and OE perl libs) which cause the autoconf
> +  # command to segfault may go undetected.
> +
> +  my $tmp = File::Temp->new();
> +
> +  if ($ignore_autoconf_errors)
> +    {
> +      xsystem ("$autoconf_cmd > $tmp || true");
> +    }
> +  else
> +    {
> +      xsystem ("$autoconf_cmd > $tmp");
> +    }
> +
> +  my $traces = new Autom4te::XFile ("< $tmp");
>    while ($_ = $traces->getline)
>      {
>        $aux_dir = $1                 if /AC_CONFIG_AUX_DIR:(.*)/;
> @@ -169,6 +191,8 @@ sub gnu_configize_current_directory ()
>        push @subdir, split (' ', $1) if /AC_CONFIG_SUBDIRS:(.*)/;
>      }
>
> +  close $tmp;
> +
>    # The subdirs are *optional*, they may not exist.
>    foreach (@subdir)
>      {
> --
> 1.9.1
>

