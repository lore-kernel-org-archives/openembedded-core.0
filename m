Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.21356.1626653705872176206
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 17:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CouORqSB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so13026642pju.4
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 17:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mzyCFmM8vRy7elmrPpoaomSz6HfZTYMIZfQcK+e1PU=;
        b=CouORqSBn/I4zqMItVbLnMlgUd6zZJPqIZsZv/NBFHxn8YJVYoRN4/gd8RFEKeDwSD
         HjfFJMloyRSYC3xBzA8W1yWryYJPFv2BQdSKlS3fME1CVtsHKlpZA9ANiWwr0BkBvU+S
         00GIifZeEJN6RD11a2Z83nQlnUe7i2lpafC//W1Vc9u4tf7fhNBnW+C9ctUSFpTGzlk6
         VERaNJA2hiJEB+5+bXKWT+G5/4DZUH82IZFqngqUazlPn0rvtBMyUSNreBDS7Su4MCv5
         DdmS3NaQpvJqU5A93Hqqz69dfhV7qmpE6HWLuQDqmvLhEoJl6VRTXbKswsWEk+R8uVZu
         AsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mzyCFmM8vRy7elmrPpoaomSz6HfZTYMIZfQcK+e1PU=;
        b=Fcn0RJdcvAM+JROcOlgX8AyJXckYYvwrNgHNIVapDcHuStG4fmWo5Nf7dgnwjEoFbD
         CrlDhCjTQ9fZmfSuqd47tT0i9i+YXF0zSr01Va3BRYI/2sPdHnw2Y1dCh7ceKYh3J9wI
         ayMzNhSB1dkfnF9ijjE58gnBU0TKClSJbsVIMazLxv8hNRp4S3ujganNGKVn0a4pTgU7
         WJ4sCXDk2HW7cwjr6WPW5iXRTivIu10G9+o6qn52FjKON0wXStRi81BRqgY6437yyCGv
         GtLPUtdghnkMOAPUzvjB+On3aBzw0GLRiIccqoq+gtH81yg09SNIJsUfJ8EP87DJDIeN
         S+BQ==
X-Gm-Message-State: AOAM5315G4tA02dXJPUlefL3S0E8ldeyFV16Dj11Mb2xZnH14WtsG6ew
	hFUT/3ZXi/nSBIbcp8toBHALvabzMCZ+kQ==
X-Google-Smtp-Source: ABdhPJwgp5gLgbIDpILVO/wtJoP3vKUc/tvcpyImrqv8vIcQfJ6pAe2MWVMEVPuPn+Er+B3HtEQgqQ==
X-Received: by 2002:a17:90a:658c:: with SMTP id k12mr27117049pjj.167.1626653705018;
        Sun, 18 Jul 2021 17:15:05 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:d2e4:4478:7db4:dfbd])
        by smtp.gmail.com with ESMTPSA id x30sm17344225pfh.126.2021.07.18.17.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 17:15:04 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tony Tascioglu <tony.tascioglu@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <timothy.t.orling@intel.com>,
	steve@sakoman.com
Subject: [dunfell][PATCH 0/1] libxml2: Update to 2.9.12
Date: Sun, 18 Jul 2021 17:14:47 -0700
Message-Id: <cover.1626652989.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cherry-pick/back port commit from master.

Since 2.9.10, upstream libxml2 has enabled fuzz testing and MANY
commits have been added with fixes and security patches.

Of the 239 commits since 2.9.10, 94 have "Fix" in the shortlog.
A quick scan of the rest of the commits (see below) shows that the
vast majority are bug fixes or security related.

While we have been patching individual CVEs in the past, it seems
like 2.9.12 contains enough significant value from a security
perspective to warrant the version update in dunfell.

$ git log --oneline v2.9.10..v2.9.12:
b48e77cf Release of libxml2-2.9.12
e1bcffea Release of libxml2-2.9.11
8598060b Patch for security issue CVE-2021-3541
bfd2f430 Fix null deref in legacy SAX1 parser
ce00c36e Store per-element parser state in a struct
de5b624f Fix handling of unexpected EOF in xmlParseContent
3e80560d Fix line numbers in error messages for mismatched tags
7279d236 Fix htmlTagLookup
33468d7e update for xsd:language type check
babe7503 Propagate error in xmlParseElementChildrenContentDeclPriv
5465a8e5 Update INSTALL.libxml2
1098c30a Fix user-after-free with `xmllint --xinclude --dropdtd`
72b3c067 Fix dangling pointer with `xmllint --dropdtd`
bf227135 Validate UTF8 in xmlEncodeEntities
1358d157 Fix use-after-free with `xmllint --html --push`
fb08d9fe Fix include order in c14n.h
d3a02679 CMake: Only add postfixes if MSVC
868e49cf Allow FP division by zero in xmlXPathInit
d25460da Fix XPath NaN/Inf for older GCC versions
e20c9c14 Fix xmlGetNodePath with invalid node types
c3fd8c42 Fix exponential behavior with recursive entities
683de7ef Fix duplicate xmlStrEqual calls in htmlParseEndTag
8095365b Speed up htmlCheckAutoClose
b25acce8 Speed up htmlTagLookup
ad101bb5 Clarify xmlNewDocProp documentation
a6e6498f Stop checking attributes for UTF-8 validity
8446d459 Reduce some fuzzer timeouts
688b41a0 Fix quadratic behavior when looking up xml:* attributes
ce2fbaa8 Only run a few CI tests unless scheduled
85c817a2 Improve fuzzer stability
f9ccb3b8 Check for feature flags in fuzzer tests
88c657d6 Use CMake PROJECT_VERSION
7a90bdfa Another attempt at improving fuzzer stability
0fb3ae58 Revert "Improve HTML fuzzer stability"
0987001c Add charset names to fuzzing dictionaries
de1b51ed Improve HTML fuzzer stability
09320f05 Add CI for MSVC x86
dcb80b92 Fix slow parsing of HTML with encoding errors
02bee4c4 Add a flag to not output anything when xmllint succeeded
4defa2c2 Fix warnings in libxml.m4 with autoconf 2.70+.
cbe1212d Fix null deref introduced with previous commit
01411e7c Check for invalid redeclarations of predefined entities
07920b43 Add the copy of type from original xmlDoc in xmlCopyDoc()
2065d340 Add CI for CMake on MSVC
afad3721 parser.c: shrink the input buffer when appropriate
ec808a44 Speed up HTML fuzzer
e6495e47 Remove unused encoding parameter of HTML output functions
954696e7 Fix infinite loop in HTML parser introduced with recent commits
acb35667 Fix quadratic runtime when parsing CDATA sections
f93ca3e1 Update minimum required CMake version
00487289 Add variables for configured options to CMake config files
95519737 Check if variables exist when defining targets
c26e4525 Check if target exists when reading target properties
ec119875 Add xmlcatalog target and definition to config files
2377a312 Remove include directories for link-only dependencies
26835480 Fix ICU build in CMake
296ab61e Configure pkgconfig, xml2-config, and xml2Conf.sh file
79301d3d Fix timeout when handling recursive entities
45da175c Fix memory leak in xmlParseElementMixedContentDecl
1d73f07d Fix null deref in xmlStringGetNodeList
e2b975c3 Handle malloc failures in fuzzing code
a67b63d1 use new htmlParseLookupCommentEnd to find comment ends
29f5d20e htmlParseComment: treat `--!>` as if it closed the comment
e28d9347 add test coverage for incorrectly-closed comments
9086988f Enforce maximum length of fuzz input
1fe38530 Remove temporary members from struct _xmlXPathContext
8ca3a59b Fix integer overflow in xmlSchemaGetParticleTotalRangeMin
649d02ea encoding: fix memleak in xmlRegisterCharEncodingHandler()
cb7a572b xmlschemastypes.c: xmlSchemaGetFacetValueAsULong add, check "facet->val"
84b76d99 Update CMake config files
d0ccb3a6 Add xmlcatalog and xmllint to CMake export
acdc2ff3 Simplify xmlexports.h
a218ff0e Fix null pointer deref in xmlXPtrRangeInsideFunction
94c2e415 Fix quadratic runtime in HTML push parser with null bytes
1c4f9a6d Require dependencies based on enabled CMake options
faea2fa9 Avoid quadratic checking of identity-constraints
8272db53 Use NAMELINK_COMPONENT in CMake install
5c7bdbc9 Add CMake files to EXTRA_DIST
7a62870a Add missing compile definition for static builds to CMake
e028d293 Add CI for CMake on Linux and MinGW
b516ed18 Fix building with ICU 68.
ac5e9991 Convert python/libxml.c to PY_SSIZE_T_CLEAN
f42a0524 Build the Python extension with PY_SSIZE_T_CLEAN
0ace6c4d Add CI test for Python 3
7c06d99e Fix xmlURIEscape memory leaks.
31c6ce3b Avoid call stack overflow with XML reader and recursive XIncludes
7d6837ba Fix caret in regexp character group
8a85263f Add fuzzing dictionaries to EXTRA_DIST
1bde1040 Add 'fuzz' subdirectory to DIST_SUBDIRS
c0c26ff2 parser.c: xmlParseCharData peek behavior fixed wrt newlines
b46016b8 Allow port numbers up to INT_MAX
46837d47 Fix memory leaks in XPointer string-range function
0b3c64d9 Handle dumps of corrupted documents more gracefully
847a3a11 Fix use-after-free when XIncluding text from Reader
7929f057 Fix SEGV in xmlSAXParseFileWithData
e6ec58ec Fix null deref in XPointer expression error path
4e9cc18b Fix variable name in win32/configure.js
5614c078 Fix version parsing in win32/configure.js
8b88503a Don't call xmlXPathInit directly
b215c270 Fix cleanup of attributes in XML reader
f0fd1b67 Limit size of free lists in XML reader when fuzzing
ba589adc Fix double free in XML reader with XIncludes
6f1470a5 Hardcode maximum XPath recursion depth
8c3ef083 Pass URL of main entity in XML fuzzer
0d5f3710 Consolidate seed corpus generation
0d9da029 Test fuzz targets with dummy driver
3fcf3193 Fix regression introduced with commit d88df4b
87d20b55 Fix regression introduced with commit 74dcc10b
fbb7fa9a Fix memory leak in xmlXIncludeAddNode error paths
19cae17f Revert "Fix quadratic runtime in xi:fallback processing"
d63cfeca Add TODO comment in xinclude.c
804c5297 Stop using maxParserDepth in xpath.c
74dcc10b Remove dead code in xinclude.c
0ff52748 Fix autotools warnings
2c747129 Fix error reporting with xi:fallback
27119ec3 Fix quadratic runtime in xi:fallback processing
d88df4bd Fix corner case with empty xi:fallback
00a86d41 Don't add formatting newlines to XInclude nodes
dba82a8c Fix XInclude regression introduced with recent commit
e1c2d0ad Fix memory leak in runtest.c
2b4769a6 Make "xmllint --push --recovery" work
99fc048d Don't use SAX1 if all element handlers are NULL
c1ba6f54 Revert "Do not URI escape in server side includes"
b82fa3dd Fix column number accounting in xmlParse*NameAndCompare
438e595a Stop counting nbChars in parser context
f6a9541f Remove unneeded progress checks in HTML parser
9de7b94d Use strcmp when fuzzing
10a07948 Fix XPath fuzzer
6c128fd5 Fuzz XInclude engine
50f06b3e Fix out-of-bounds read with 'xmllint --htmlout'
1abf2967 Fix exponential runtime and memory in xi:fallback processing
11b57459 Don't process siblings of root in xmlXIncludeProcess
0f9817c7 Don't recurse into xi:include children in xmlXIncludeDoProcess
5725c115 Fix memory leak in xmlXIncludeIncludeNode error paths
ad26a60f Add XPath and XPointer fuzzer
956534e0 Check for custom free function in global destructor
8e7c20a1 Fix integer overflow when comparing schema dates
905820a4 Update fuzzing code
68eadabd Fix exponential runtime in xmlFARecurseDeterminism
1a360c1c More *NodeDumpOutput fixes
7b2e5172 Fix *NodeDumpOutput functions
dc6f0092 Make xmlNodeDumpOutputInternal non-recursive
5330153d Make xhtmlNodeDumpOutput non-recursive
b79ab6e6 Make htmlNodeDumpFormatOutput non-recursive
21ca8829 Don't try to handle namespaces when building HTML documents
93ce33c2 Fix several quadratic runtime issues in HTML push parser
10d09472 Fix .gitattributes
173a0830 Fix quadratic runtime when push parsing HTML start tags
0e5c4fec Reset XML parser input before reporting errors
6995eed0 Fix quadratic runtime when push parsing HTML entity refs
8e219b15 Fix HTML push parser lookahead
e050062c Make htmlCurrentChar always translate U+0000
dfd4e330 Rework control flow in htmlCurrentChar
922bebcc Make 'xmllint --html --push -' read from stdin
1493130e Fix UTF-8 decoder in HTML parser
beb7d71a Remove misleading comments in xpath.c
50078922 Fix quadratic runtime when parsing HTML script content
d6761e70 Update to Devhelp index file format version 2
d514e2bd Set project language to C
5ddf02f2 Update config.h.cmake.in
8bec210d Add variable for working directory of XML Conformance Test Suite
270e1655 Add additional tests and XML Conformance Test Suite
e6ba4bd7 Add command line option for temp directory in runtest
40e7ceaa Ensure LF line endings for test files
9ecf5ad6 Enable runtests and testThreads
3f18e748 Reset HTML parser input before reporting error
3da8d947 Fix more quadratic runtime issues in HTML push parser
741b0d0a Fix regression introduced with 477c7f6a
fc842f6e Limit regexp nesting depth
1e41e4fa Fix return values and documentation in encoding.c
6b4717d6 Add regexp regression tests
477c7f6a Fix quadratic runtime in HTML parser
f8329fdc Report error for invalid regexp quantifiers
13ba5b61 Reset HTML parser input before reporting encoding error
1e7851b5 Fix integer overflow in xmlFAParseQuantExact
84bab955 Fix return value of xmlC14NDocDumpMemory
43a8836c Fix rebuilding docs, by hiding __attribute__((...)) behind a macro.
9f42f6ba Don't follow next pointer on documents in xmlXPathRunStreamEval
c0440868 Copy xs:duration parser from libexslt
18425d3a Fix integer overflow in _xmlSchemaParseGYear
070d635e Fix integer overflow when parsing {min,max}Occurs
50f18830 Fix another memory leak in xmlSchemaValAtomicType
eac1c7e2 Fuzz target for XML Schemas
ffd31dbe Move entity recorder to fuzz.c
681f094e Fix unsigned integer overflow in htmlParseTryOrFinish
31ca4a72 Fix integer overflow in htmlParseCharRef
2f938203 Fix undefined behavior in UTF16LEToUTF8
536f421d Fuzz target for HTML parser
a697ed1e Fix return value of xmlCharEncOutput
af893a58 Update GitLab CI container
a28f7d87 Never expand parameter entities in text declaration
487871b0 Fix undefined behavior in xmlXPathTryStreamCompile
e98150d4 Add options file for xml fuzzer
2af3c2a8 Fix use-after-free with validating reader
00ed736e Add a couple of libFuzzer targets
2e8cc66d xmlParseBalancedChunkMemory must not be called with NULL doc
a0a8059b Revert "Fix memory leak in xmlParseBalancedChunkMemoryRecover"
ff009f99 Fix memory leak in xmlXIncludeLoadDoc error path
a230b728 win32: allow passing *FLAGS on command line
4f2aee18 Make schema validation fail with multiple top-level elements
106757e8 Guard new calls to xmlValidatePopElement in xml_reader.c
386fb276 Add LIBXML_VALID_ENABLED to xmlreader
e7ff2efc Configure file xmlwin32version.h.in on MSVC
e2f10494 List headers individually
2a2c38f3 Add CMake build files
9fa3200c Call xmlCleanupParser on ELF destruction
e4fb3684 Parenthesize Py<type>_Check() in ifs
20c60886 Fix typos
2a7b6684 Disable LeakSanitizer
c005c7a0 Stop calling SAX getEntity handler from XMLReader
32cb5dcc Add test case for recursive external parsed entities
f20daa9e Enable error tests with entity substitution
eddfbc38 Don't load external entity from xmlSAX2GetEntity
1a3e584a Merge code paths loading external entities
5c7e0a9a Copy some XMLReader option flags to parser context
f9ea1a24 Fix copying of entities in xmlParseReference
7ffcd44d Fix memory leak in xmlSchemaValidateStream
e45e06de Fix xmlSchemaGetCanonValue formatting for date and dateTime
c7c526d6 Fix memory leak when shared libxml.dll is unloaded
453bdfb9 Fix potentially-uninitialized critical section in Win32 DLL builds
c2e09f44 Add xmlPopOutputCallbacks
b0725121 Fix integer overflow in xmlBufferResize
3e7e75be Minor fixes to configure.js
52649b63 Check for overflow when allocating two-dimensional arrays
9bd7abfb Remove useless comparisons
c9faa292 Fix overflow check in xmlNodeDump
8f62ac92 Updated Python test reader2.py
8c3e52eb Updated python/tests/tstLastError.py
0e1a49c8 Fix infinite loop in xmlStringLenDecodeEntities
0815302d Fix freeing of nested documents
2c80fc91 Fix more memory leaks in error paths of XPath parser
3c8a3e99 Use random seed in xmlDictComputeFastKey
42942066 Fix memory leaks of encoding handlers in xmlsave.c
2a357ab9 Fix xml2-config error code
d5f2f74d Fix memory leak in error path of XPath expr parser
bf2e9617 Fix overflow handling in xmlBufBackToBuffer
d7248615 Null pointer handling in catalog.c
29740ed1 xml2-config.in: fix regressions introduced by commit 2f2bf4b2c
db0c0450 Enable more undefined behavior sanitizers

The following changes since commit cfd74f2bae51413d9c327e0f08ecf751325c2d74:

  report-error: Drop pointless inherit (2021-07-11 06:19:43 -1000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib timo/dunfell/libxml2-2.9.12

Tony Tascioglu (1):
  libxml2: Update to 2.9.12

 ...he-python-tests-if-python-is-enabled.patch | 34 +++++----------
 .../libxml/libxml2/CVE-2019-20388.patch       | 37 ----------------
 .../libxml/libxml2/CVE-2020-24977.patch       | 41 ------------------
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 ----------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 33 ++++++++------
 .../libxml2/remove-fuzz-from-ptests.patch     | 43 +++++++++++++++++++
 .../{libxml2_2.9.10.bb => libxml2_2.9.12.bb}  | 17 +++-----
 7 files changed, 80 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.10.bb => libxml2_2.9.12.bb} (85%)

-- 
2.30.2

