Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CD0C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:28:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13394.1633012079546852715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 12E9924000E;
	Thu, 30 Sep 2021 14:27:57 +0000 (UTC)
Date: Thu, 30 Sep 2021 16:27:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] ruby: fix the reproducibility issue
Message-ID: <YVXJbXdrjaCdsdGi@piout.net>
References: <20210930140424.438761-1-thomas.perrot@bootlin.com>
 <CANNYZj8ho6hhP4W2oFoQpP5rsqroG9Cww27JABKYcfJKiZck5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj8ho6hhP4W2oFoQpP5rsqroG9Cww27JABKYcfJKiZck5g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 14:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156502

On 30/09/2021 16:12:30+0200, Alexander Kanavin wrote:
> Does this mean ruby can be dropped from reproducibility exception list?
> 

That is the goal, I'll run that through the autobuilders

> Alex
> 
> On Thu, 30 Sept 2021 at 16:04, Thomas Perrot <thomas.perrot@bootlin.com>
> wrote:
> 
> > Apply some changes on the Ruby makefiles in order to fix the
> > reproducibility:
> > - use a fixed timestamp,
> > - sort linked objects,
> > - doesn't use the current date,
> > - and use UTC date.
> >
> > [YOCTO #14268]
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> >  ...doc-build-reproducible-documentation.patch | 35 ++++++++++
> >  ...-list-of-object-files-in-generated-M.patch | 28 ++++++++
> >  ...eproducible-change-fixing-784225-too.patch | 28 ++++++++
> >  .../0006-Make-gemspecs-reproducible.patch     | 67 +++++++++++++++++++
> >  meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  4 ++
> >  5 files changed, 162 insertions(+)
> >  create mode 100644
> > meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> >  create mode 100644
> > meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> >  create mode 100644
> > meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> >  create mode 100644
> > meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> >
> > diff --git
> > a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > new file mode 100644
> > index 000000000000..f92f0e1ba683
> > --- /dev/null
> > +++
> > b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > @@ -0,0 +1,35 @@
> > +From: Christian Hofstaedtler <zeha@debian.org>
> > +Date: Tue, 10 Oct 2017 15:04:34 -0300
> > +Subject: rdoc: build reproducible documentation
> > +
> > +- provide a fixed timestamp to the gzip compression
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> > +---
> > + lib/rdoc/generator/json_index.rb | 4 ++--
> > + lib/rdoc/rdoc.rb                 | 2 +-
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +--- a/lib/rdoc/generator/json_index.rb
> > ++++ b/lib/rdoc/generator/json_index.rb
> > +@@ -178,7 +178,7 @@
> > +     debug_msg "Writing gzipped search index to %s" % outfile
> > +
> > +     Zlib::GzipWriter.open(outfile) do |gz|
> > +-      gz.mtime = File.mtime(search_index_file)
> > ++      gz.mtime = -1
> > +       gz.orig_name = search_index_file.basename.to_s
> > +       gz.write search_index
> > +       gz.close
> > +@@ -196,7 +196,7 @@
> > +         debug_msg "Writing gzipped file to %s" % outfile
> > +
> > +         Zlib::GzipWriter.open(outfile) do |gz|
> > +-          gz.mtime = File.mtime(dest)
> > ++          gz.mtime = -1
> > +           gz.orig_name = dest.basename.to_s
> > +           gz.write data
> > +           gz.close
> > diff --git
> > a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > new file mode 100644
> > index 000000000000..e0aca0dcfc10
> > --- /dev/null
> > +++
> > b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > @@ -0,0 +1,28 @@
> > +From: Reiner Herrmann <reiner@reiner-h.de>
> > +Date: Tue, 10 Oct 2017 15:06:13 -0300
> > +Subject: lib/mkmf.rb: sort list of object files in generated Makefile
> > +
> > +Without sorting the list explicitly, its order is indeterministic,
> > +because readdir() is also not deterministic.
> > +When the list of object files varies between builds, they are linked
> > +in a different order, which results in an unreproducible build.
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > +Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
> > +---
> > + lib/mkmf.rb | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +--- a/lib/mkmf.rb
> > ++++ b/lib/mkmf.rb
> > +@@ -2315,7 +2315,7 @@
> > + LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
> > + ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
> > + SRCS = $(ORIG_SRCS) #{(srcs -
> > orig_srcs).collect(&File.method(:basename)).join(' ')}
> > +-OBJS = #{$objs.join(" ")}
> > ++OBJS = #{$objs.sort.join(" ")}
> > + HDRS = #{hdrs.map{|h| '$(srcdir)/' + File.basename(h)}.join(' ')}
> > + LOCAL_HDRS = #{$headers.join(' ')}
> > + TARGET = #{target}
> > diff --git
> > a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > new file mode 100644
> > index 000000000000..b7faa58655b2
> > --- /dev/null
> > +++
> > b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > @@ -0,0 +1,28 @@
> > +From: Christian Hofstaedtler <zeha@debian.org>
> > +Date: Tue, 10 Oct 2017 15:07:11 -0300
> > +Subject: Mark Gemspec-reproducible change fixing #784225, too
> > +
> > +I think the UTC date change will fix the Multi-Arch not-same file issue,
> > +too.
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> > +---
> > + lib/rubygems/specification.rb | 4 +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +--- a/lib/rubygems/specification.rb
> > ++++ b/lib/rubygems/specification.rb
> > +@@ -1695,7 +1695,9 @@
> > +                 raise(Gem::InvalidSpecificationException,
> > +                       "invalid date format in specification:
> > #{date.inspect}")
> > +               end
> > +-            when Time, DateLike then
> > ++            when Time then
> > ++              Time.utc(date.utc.year, date.utc.month, date.utc.day)
> > ++            when DateLike then
> > +               Time.utc(date.year, date.month, date.day)
> > +             else
> > +               TODAY
> > diff --git
> > a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > new file mode 100644
> > index 000000000000..504893b4b4ff
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > @@ -0,0 +1,67 @@
> > +From: Lucas Kanashiro <kanashiro@debian.org>
> > +Date: Fri, 1 Nov 2019 15:25:17 -0300
> > +Subject: Make gemspecs reproducible
> > +
> > +Without an explicit date, they will get the current date and make the
> > +build unreproducible
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +---
> > + ext/bigdecimal/bigdecimal.gemspec | 1 +
> > + ext/fiddle/fiddle.gemspec         | 1 +
> > + ext/io/console/io-console.gemspec | 2 +-
> > + lib/ipaddr.gemspec                | 1 +
> > + lib/rdoc/rdoc.gemspec             | 1 +
> > + 5 files changed, 5 insertions(+), 1 deletion(-)
> > +
> > +--- a/ext/bigdecimal/bigdecimal.gemspec
> > ++++ b/ext/bigdecimal/bigdecimal.gemspec
> > +@@ -6,6 +6,7 @@
> > +   s.name          = "bigdecimal"
> > +   s.version       = bigdecimal_version
> > +   s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo Kobayashi"]
> > ++  s.date          = RUBY_RELEASE_DATE
> > +   s.email         = ["mrkn@mrkn.jp"]
> > +
> > +   s.summary       = "Arbitrary-precision decimal floating-point number
> > library."
> > +--- a/ext/fiddle/fiddle.gemspec
> > ++++ b/ext/fiddle/fiddle.gemspec
> > +@@ -8,6 +8,7 @@
> > + Gem::Specification.new do |spec|
> > +   spec.name          = "fiddle"
> > +   spec.version       = version_module::Fiddle::VERSION
> > ++  spec.date          = RUBY_RELEASE_DATE
> > +   spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
> > +   spec.email         = ["aaron@tenderlovemaking.com", "
> > hsbt@ruby-lang.org"]
> > +
> > +--- a/ext/io/console/io-console.gemspec
> > ++++ b/ext/io/console/io-console.gemspec
> > +@@ -4,6 +4,7 @@
> > + Gem::Specification.new do |s|
> > +   s.name = "io-console"
> > +   s.version = _VERSION
> > ++  s.date = RUBY_RELEASE_DATE
> > +   s.summary = "Console interface"
> > +   s.email = "nobu@ruby-lang.org"
> > +   s.description = "add console capabilities to IO instances."
> > +--- a/lib/ipaddr.gemspec
> > ++++ b/lib/ipaddr.gemspec
> > +@@ -6,6 +6,7 @@
> > + Gem::Specification.new do |spec|
> > +   spec.name          = "ipaddr"
> > +   spec.version       = "1.2.2"
> > ++  spec.date          = RUBY_RELEASE_DATE
> > +   spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
> > +   spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
> > +
> > +--- a/lib/rdoc/rdoc.gemspec
> > ++++ b/lib/rdoc/rdoc.gemspec
> > +@@ -7,6 +7,7 @@
> > +
> > + Gem::Specification.new do |s|
> > +   s.name = "rdoc"
> > ++  s.date = RUBY_RELEASE_DATE
> > +   s.version = RDoc::VERSION
> > +
> > +   s.authors = [
> > diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > index 38e594a59ef3..2abf504d91bc 100644
> > --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > @@ -7,6 +7,10 @@ SRC_URI += " \
> >             file://run-ptest \
> >
> > file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
> >             file://0002-template-Makefile.in-filter-out-f-prefix-map.patch
> > \
> > +           file://0003-rdoc-build-reproducible-documentation.patch \
> > +
> >  file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
> > +
> >  file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
> > +           file://0006-Make-gemspecs-reproducible.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =
> > "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
> > --
> > 2.31.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156493):
> > https://lists.openembedded.org/g/openembedded-core/message/156493
> > Mute This Topic: https://lists.openembedded.org/mt/85974381/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

