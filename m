Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web10.10795.1626096161239389333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=XttpAUUB;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1626096158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MCukJNU9PiBdrCKjrdjA73l5GhsYShfTv9+yd8TpPW35UvD6zUzCe91nuExrUHm9hXjhJWR5ba2vNKFN6ao0AKnEXOFGYBRfYhb+eDH8RmiSrpWi1iQjiqsxwS7lML++7lD+n7Dw8504vIYyyxM0j/hjU9JVAWE8FKgg3mlQNJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626096158; h=Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=539eatsZl9zAS85JV7FIht+STv+Nevk9kenWtc+wYLE=; 
	b=Jif+7hGZUFn+inRTDu98TUeo7tj8vi1DgM+2SR84kidD/dexUBZu5hSLZtZKBYY8iAmeb1JLa6BP8rkmzXkdWcePvD2e/HjhoiFAEV4Kk+8+C9fJ/30uI4uW0ar/5Or5UaRsBFXnN+gmpnnnEMropxLMcJ0aCZMM3D5L468adaM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626096158;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=539eatsZl9zAS85JV7FIht+STv+Nevk9kenWtc+wYLE=;
	b=XttpAUUBEopVZso+joMdVmZ3kgWuEf16YLf6UkNmeBQFYUeEeEvT9eiblSzqLQF9
	PeCIqlUKr40/6dHQUDVKEUKVZZOl9NsZqOmej1/DTI8bc4hmSi/SBDJq8QyBG5zDg92
	Djr4Ml2dvrWtx74GcIEcECHxl5N/V5UtW6Cq9GQI=
Received: from dell.adbgroup.pl (178.217.216.129 [178.217.216.129]) by mx.zohomail.com
	with SMTPS id 1626096157494582.7677836449758; Mon, 12 Jul 2021 06:22:37 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gobject-introspection: Fix the license (add MIT)
Date: Mon, 12 Jul 2021 15:22:22 +0200
Message-Id: <20210712132222.2809116-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

As per upstream the license should also include MIT[1]. This is also
what Fedora Linux uses[2].

This should also address the problem with auto-generated scannerparser.h
file which has the following header:

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

Taking advantage of the Bison expcetion, more precisely the following fragment:

 "distribute that work under terms of your choice"

it should also be possible to reuse the MIT license tag for redistribution of that
work instead of adding the default GPLv3+ tag (which would otherwise be required
without using the special exception).

[1] https://gitlab.gnome.org/GNOME/gobject-introspection/-/blob/master/COPYING#L8
[2] https://src.fedoraproject.org/rpms/gobject-introspection/c/6db290968fa1f92967851dc60115dfb3ea173cf7?branch=rawhide

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 .../gobject-introspection/gobject-introspection_1.68.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
index 4c986a574f..048deabe64 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
@@ -6,7 +6,7 @@ generation for bindings, API verification and documentation generation."
 HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gobject-introspection/issues"
 SECTION = "libs"
-LICENSE = "LGPLv2+ & GPLv2+"
+LICENSE = "LGPLv2+ & GPLv2+ & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
-- 
2.31.1

