Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86C7CA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 17:48:29 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.497.1791827300401950190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 10:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MeSk6qaV;
 spf=pass (domain: mvista.com, ip: 74.125.82.177, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so1319932eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791827300; x=1792432100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFrBta6GGZrAymBkRW34uhSTioJRuyKQ/lSDqp02D9o=;
        b=MeSk6qaVAl5Kc0vO57Ec4xxHmDBfEZd5qZ3JDR+xYhGizRt1xheexYAjJ7/GO+17UM
         zkcRO0IApquPJ8AOcnlZ6DFTNmDapQ7RGgOUXfiIXRNkOJCmzacjT592rz5s8I0q2Xtg
         MoiSa3PzZmLuW0xBK+cX+hXlIHWNWFJ36AQag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827300; x=1792432100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFrBta6GGZrAymBkRW34uhSTioJRuyKQ/lSDqp02D9o=;
        b=joAGprjJ8FQ7XmW1cwyG5ZZGKkiite8v9f/2Rx6Zofilw/cPKGFcrSCmAWIOf/QsTh
         qvU+i/gNItg2WqSQt75yS+p2zitaKm6XW3YcbExRjkdLnpqc7/LhiCLtgP/S3o6vxxHU
         ys6KjfaINDHjOiYjirWKGCAh6WD4R4gKGaVFH+2AAfViV6tC5bcF7D9pKZzIJw8JN6ki
         AZiXgELfXpVp5xBNRJXGbYXCrJ4bn+eT6wN8Oqkbu0VbSJ+9rMw2gPdYCcE42FxtX3ug
         xrzGxTW2ED/3+EhWaArX1+ii814DLPR7Ri6+yZi+PlhhIjqeDQgU5nEdCE9i9Qa2myfq
         lC8w==
X-Gm-Message-State: AFq9FYISD+RP6nU/kgNK0k4hvu0ULmaTFuMB8ulI311NkEihxLNpI9Cn
	3QY8PLW0aX3sPLycBhlziGFSX8vMHinOO4eVJKF7D/wHEiyTlTo2jmkg7EXG6j9p8AK2VVjGRil
	3uHl0BUo=
X-Gm-Gg: AYBFou0197AMsGvEcs32WSiXVxftupJ0bD9xVY1Av+w8uhoY1wE88yOEI+XkgR9Q++J
	tTT4l/Fh/lxPAY7JVB3JEW8qZISIdHi2iyfhQrkW1Bg/bLFrB5CYG4S1ZlgcMWMr99uAGiwEIAG
	P1BvXkRwtFOQAh7rHSuqDhoojBaFbdrXvA/wxXs2HnII34jBmjgMEQAn8Wyi3t6xwJAMKhREN60
	SgdFR8O/dq6+4MaK3RKfPDh1avWRYCrJzxlpsnih4x3eEiVjXjY9p1w6PVlxI2bspm+IRT8z3CM
	z5eEE/YJfX2PIEzZPY7TWy5zUoVZdm2GbIAgpSryhVJqMIVbcH6/bTwecEo0irG+zxrrKS2r53V
	W59eNVm80iNwIk2xC0b91YCnHcTsk/pohoStaWuLqLO04BI/aATPJEP2It5mlj5bq2alXW700Sk
	POmoJ6YFdIZ5QzUE/Nw3pa85reZKMKOk4JTAO17XRY8SbqMKQ47z5Ew2gmhHynj1x7e2iXeFApC
	d9pAw==
X-Received: by 2002:a05:693c:8099:b0:358:c755:81a9 with SMTP id 5a478bee46e88-358c75589d0mr9226809eec.11.1791827298925;
        Mon, 12 Oct 2026 10:48:18 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.212.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm34565596eec.28.2026.10.12.10.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:48:17 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] perl: Security fix for CVE-2026-48962
Date: Mon, 12 Oct 2026 23:18:10 +0530
Message-Id: <20261012174810.45428-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 17:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247673

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://github.com/pmqs/IO-Compress/commit/f2db247bf90d4cc7ee2710be384946081f3b4610
[2] https://security-tracker.debian.org/tracker/CVE-2026-48962

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../perl/files/CVE-2026-48962.patch           | 168 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
 2 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-48962.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-48962.patch b/meta/recipes-devtools/perl/files/CVE-2026-48962.patch
new file mode 100644
index 0000000000..b883f8e13e
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-48962.patch
@@ -0,0 +1,168 @@
+From f2db247bf90d4cc7ee2710be384946081f3b4610 Mon Sep 17 00:00:00 2001
+From: pmqs <pmqs@cpan.org>
+Date: Sat, 16 May 2026 17:48:34 +0100
+Subject: [PATCH] remove use of eval in globmapper. #73
+
+CVE: CVE-2026-48962
+Upstream-Status: Backport [https://github.com/pmqs/IO-Compress/commit/f2db247bf90d4cc7ee2710be384946081f3b4610]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ cpan/IO-Compress/lib/File/GlobMapper.pm | 52 ++++++++++++++++++++-----
+ cpan/IO-Compress/t/globmapper.t         | 52 ++++++++++++++++++++++++-
+ 2 files changed, 94 insertions(+), 10 deletions(-)
+
+diff --git a/cpan/IO-Compress/lib/File/GlobMapper.pm b/cpan/IO-Compress/lib/File/GlobMapper.pm
+index f015b16..8936146 100644
+--- a/cpan/IO-Compress/lib/File/GlobMapper.pm
++++ b/cpan/IO-Compress/lib/File/GlobMapper.pm
+@@ -29,6 +29,11 @@ our ($VERSION, @EXPORT_OK);
+ $VERSION = '1.001';
+ @EXPORT_OK = qw( globmap );
+ 
++our $BEGIN_DELIM = "\xFF"#########################
++our $END_DELIM   = "\xFE";
++our $BACKSLASH_ESC = "\xFD";
++our $HASH_ESC = "\xFC";
++our $STAR_ESC = "\xFB";
+ 
+ our ($noPreBS, $metachars, $matchMetaRE, %mapping, %wildCount);
+ $noPreBS = '(?<!\\\)' ; # no preceding backslash
+@@ -310,14 +315,23 @@ sub _parseOutputGlob
+     }
+ 
+     my $noPreBS = '(?<!\\\)' ; # no preceding backslash
+-    #warn "noPreBS = '$noPreBS'\n";
++    my $noPreESC = '(?<![${BEGIN_DELIM}])' ; # no preceding backslash
+ 
+-    #$string =~ s/${noPreBS}\$(\d)/\${$1}/g;
+-    $string =~ s/${noPreBS}#(\d)/\${$1}/g;
+-    $string =~ s#${noPreBS}\*#\${inFile}#g;
+-    $string = '"' . $string . '"';
++    # escape any use of the delimiter symbols
++    # $string =~ s/(${BEGIN_DELIM}|${END_DELIM}|${BACKSLASH_ESC})/$1$1/g;
++
++    # escape \# and \*
++    $string =~ s/\\#/${HASH_ESC}/g;
++    $string =~ s/\\\*/${STAR_ESC}/g;
++
++    # Transform "#3" to BEGIN_DELIM 3 END_DELIM
++    $string =~ s/${noPreESC}#(\d)/${BEGIN_DELIM}${1}${END_DELIM}/g;
++
++    $string =~ s#\*#${BEGIN_DELIM}${END_DELIM}#g;
++
++    # print "INPUT  '$self->{InputPattern}'\n";
++    # print "OUTPUT '$self->{OutputGlob}' => '$string'\n";
+ 
+-    #print "OUTPUT '$self->{OutputGlob}' => '$string'\n";
+     $self->{OutputPattern} = $string ;
+ 
+     return 1 ;
+@@ -335,11 +349,31 @@ sub _getFiles
+         next if $inFiles{$inFile} ++ ;
+ 
+         my $outFile = $inFile ;
++        my @matches ;
++
++        my $noPreESC = '(?<![${BEGIN_DELIM}])' ; # no preceding backslash
+ 
+-        if ( $inFile =~ m/$self->{InputPattern}/ )
++        if (@matches = ($inFile =~ m/$self->{InputPattern}/ ))
+         {
+-            no warnings 'uninitialized';
+-            eval "\$outFile = $self->{OutputPattern};" ;
++            $outFile = $self->{OutputPattern};
++            my $ix = 1;
++
++            # get the filename glob
++            $outFile =~ s/${noPreESC}${BEGIN_DELIM}${END_DELIM}/$inFile/g;
++
++            # now each of the #1, #2,...
++            for my $pattern (@matches)
++            {
++                $outFile =~ s/${noPreESC}${BEGIN_DELIM}${ix}${END_DELIM}/$pattern/g;
++
++                ++ $ix;
++            }
++
++            # unescape
++            $outFile =~ s/${BEGIN_DELIM}${BEGIN_DELIM}/${BEGIN_DELIM}/g;
++            $outFile =~ s/${END_DELIM}${END_DELIM}/${END_DELIM}/g;
++            $outFile =~ s/${HASH_ESC}/#/g;
++            $outFile =~ s/${STAR_ESC}/*/g;
+ 
+             if (defined $outInMapping{$outFile})
+             {
+diff --git a/cpan/IO-Compress/t/globmapper.t b/cpan/IO-Compress/t/globmapper.t
+index c97beb6..08802ec 100644
+--- a/cpan/IO-Compress/t/globmapper.t
++++ b/cpan/IO-Compress/t/globmapper.t
+@@ -24,7 +24,7 @@ Perl $]" )
+     $extra = 1
+         if eval { require Test::NoWarnings ;  import Test::NoWarnings; 1 };
+ 
+-    plan tests => 68 + $extra ;
++    plan tests => 76 + $extra ;
+ 
+     use_ok('File::GlobMapper') ;
+ }
+@@ -290,6 +290,56 @@ Perl $]" )
+         ], "  got mapping";
+ }
+ 
++{
++    title "check escaping";
++
++    my $tmpDir ;#= 'td';
++    my $lex = LexDir->new( $tmpDir );
++
++    my $BEGIN_DELIM = "\xFF";
++    my $END_DELIM   = "\xFE";
++
++    #mkdir $tmpDir, 0777 ;
++
++    touch map { "$tmpDir/$_.tmp" } qw( abc1 abc2 abc3 ) ;
++
++    my $map = File::GlobMapper::globmap("$tmpDir/*b*.tmp", "$tmpDir/X-${BEGIN_DELIM}#2-#1${END_DELIM}-X");
++    ok $map, "  got map"
++        or diag $File::GlobMapper::Error ;
++
++    is @{ $map }, 3, "  returned 3 maps";
++    is_deeply $map,
++        [ [map { "$tmpDir/$_" } ("abc1.tmp", "X-${BEGIN_DELIM}c1-a${END_DELIM}-X")],
++          [map { "$tmpDir/$_" } ("abc2.tmp", "X-${BEGIN_DELIM}c2-a${END_DELIM}-X")],
++          [map { "$tmpDir/$_" } ("abc3.tmp", "X-${BEGIN_DELIM}c3-a${END_DELIM}-X")],
++	], "  got mapping";
++}
++
++{
++    title "check backslash escaping";
++
++    my $tmpDir ;#= 'td';
++    my $lex = LexDir->new( $tmpDir );
++
++    my $BEGIN_DELIM = "\xFF";
++    my $END_DELIM   = "\xFE";
++
++    #mkdir $tmpDir, 0777 ;
++
++    touch map { "$tmpDir/$_.tmp" } qw( abc1 abc2 abc3 ) ;
++
++    my $map = File::GlobMapper::globmap("$tmpDir/*b*.tmp", $tmpDir . '/X-#2-\\#1\\*-X');
++    ok $map, "  got map"
++        or diag $File::GlobMapper::Error ;
++
++    is @{ $map }, 3, "  returned 3 maps";
++    is_deeply $map,
++        [ [map { "$tmpDir/$_" } ("abc1.tmp", "X-c1-#1*-X")],
++          [map { "$tmpDir/$_" } ("abc2.tmp", "X-c2-#1*-X")],
++          [map { "$tmpDir/$_" } ("abc3.tmp", "X-c3-#1*-X")],
++        ], "  got mapping";
++}
++
+ # TODO
+ # test each of the wildcard metacharacters can be mapped to the output filename
+ #
+-- 
+2.44.4
+
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index 8ce5d3f5d0..a0adbacad7 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-57432-02.patch \
            file://CVE-2025-40909.patch \
            file://CVE-2026-19487.patch \
+           file://CVE-2026-48962.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.34.1


