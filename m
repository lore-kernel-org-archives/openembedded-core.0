Return-Path: <Stefan.Ghinea@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83FB86C230
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 06:27:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8A6RY3P005236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 23:27:34 -0700 (PDT)
Received: from otp-sghinea-d1.wrs.com (128.224.124.155) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 9 Sep 2019 23:27:21 -0700
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2019 09:27:20 +0300
Message-ID: <1568096840-28657-1-git-send-email-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript: CVE-2019-14811, CVE-2019-14817
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
X-List-Received-Date: Tue, 10 Sep 2019 06:27:33 -0000
Content-Type: text/plain

Issue: LIN1018-4833, LIN1018-4832

A flaw was found in, ghostscript versions prior to 9.28,
in the .pdf_hook_DSC_Creator procedure where it did not
properly secure its privileged calls, enabling scripts to
bypass `-dSAFER` restrictions. A specially crafted PostScript
file could disable security protection and then have access
to the file system, or execute arbitrary commands.

A flaw was found in, ghostscript versions prior to 9.28,
in the .pdfexectoken and other procedures where it did not
properly secure its privileged calls, enabling scripts to
bypass `-dSAFER` restrictions. A specially crafted PostScript
file could disable security protection and then have access
to the file system, or execute arbitrary commands.

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-14811
https://nvd.nist.gov/vuln/detail/CVE-2019-14817

Upstream patches:
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=885444fcbe10dc42787ecb76686c8ee4dd33bf33
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=cd1b1cacadac2479e291efe611979bdc1b3bdb19

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../ghostscript/CVE-2019-14811-0001.patch     |  68 +++++
 .../ghostscript/CVE-2019-14817-0001.patch     | 270 ++++++++++++++++++
 .../ghostscript/CVE-2019-14817-0002.patch     | 236 +++++++++++++++
 .../ghostscript/ghostscript_9.27.bb           |   3 +
 4 files changed, 577 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
new file mode 100644
index 0000000000..3f28555e8a
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
@@ -0,0 +1,68 @@
+From 885444fcbe10dc42787ecb76686c8ee4dd33bf33 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Tue, 20 Aug 2019 10:10:28 +0100
+Subject: [PATCH] make .forceput inaccessible
+
+Bug #701343, #701344, #701345
+
+More defensive programming. We don't want people to access .forecput
+even though it is no longer sufficient to bypass SAFER. The exploit
+in #701343 didn't work anyway because of earlier work to stop the error
+handler being used, but nevertheless, prevent access to .forceput from
+.setuserparams2.
+
+CVE: CVE-2019-14811
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ Resource/Init/gs_lev2.ps  | 6 +++---
+ Resource/Init/gs_pdfwr.ps | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
+index 98d55fe..f1b771f 100644
+--- a/Resource/Init/gs_lev2.ps
++++ b/Resource/Init/gs_lev2.ps
+@@ -158,7 +158,7 @@ end
+     {
+       pop pop
+     } ifelse
+-  } forall
++  } executeonly forall
+         % A context switch might have occurred during the above loop,
+         % causing the interpreter-level parameters to be reset.
+         % Set them again to the new values.  From here on, we are safe,
+@@ -229,9 +229,9 @@ end
+        { pop pop
+        }
+       ifelse
+-    }
++    } executeonly
+    forall pop
+-} .bind odef
++} .bind executeonly odef
+ 
+ % Initialize the passwords.
+ % NOTE: the names StartJobPassword and SystemParamsPassword are known to
+diff --git a/Resource/Init/gs_pdfwr.ps b/Resource/Init/gs_pdfwr.ps
+index 00c19fa..dfe504d 100644
+--- a/Resource/Init/gs_pdfwr.ps
++++ b/Resource/Init/gs_pdfwr.ps
+@@ -652,11 +652,11 @@ currentdict /.pdfmarkparams .undef
+           systemdict /.pdf_hooked_DSC_Creator //true .forceput
+         } executeonly if
+         pop
+-      } if
++      } executeonly if
+     } {
+       pop
+     } ifelse
+-  }
++  } executeonly
+   {
+     pop
+   } ifelse
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
new file mode 100644
index 0000000000..c76e21caa6
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
@@ -0,0 +1,270 @@
+From 0bafbd9c1273fab0dc79fd20db0ffc4443683f96 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Mon, 29 Apr 2019 11:14:06 +0100
+Subject: [PATCH 1/2] PDF interpreter - Decode ToUnicode entries of the form
+ /Identity-H/V
+
+Bug #701003 "Text searchability broken due to omission of /ToUnicode /Identity-H"
+
+The PDF references from 1.2 too 2.0 all state that the value associated
+with a ToUnicode key in a FontDescriptor must be a stream object. However
+this file (and one case seen previously, bug 687351) have FontDescriptor
+dictionaries where the value associated with a /ToUnicode key is a
+name object, in both cases /Identity-H.
+
+Although this is clearly not legal, Acrobat not only tolerates it, it
+actually uses it for search/copy/paste (see bug 701003 for details).
+Without the key Acrobat is unable to successfully search the output file.
+
+We can't simply preserve the name object as a ToUnicode value; when
+handling ToUnicode we actually decode the CMap and build a
+GlyphNames2Unicode map (an internal representation of the G2U data
+produced by the Microsoft PostScript printer driver). When writing the
+output file we use that information to get a Unicode value for each
+character we write, and build a new ToUnicode CMap using that.
+
+This commit tackles the problem by pre-scanning for a name object and
+then checking to see if its Identity-H or Identity-V (although we have
+not seen an Identity-V, there seems no reason why it wouldn't be
+equally valid). If we find either of these then we construct a
+GlyphNames2Unicode table for all possible values (0 - 65535) and store
+that with the font as normal. When we write the output file we only
+write the required entries for the subset font, so we write a now
+completely legal ToUnicode CMap, and Acrobat is equally happy with that
+as the original name.
+
+If the ToUnicode value isn't a name object, or isn't one of the
+identities then we proceed as before. This means we will print a
+warning for non conforming ToUnicode entries and ignore them.
+
+CVE: CVE-2019-14817
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ Resource/Init/pdf_font.ps | 200 ++++++++++++++++++++++++--------------
+ 1 file changed, 129 insertions(+), 71 deletions(-)
+
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index 9fb85f6..2df3303 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -621,86 +621,144 @@ currentdict end readonly def
+         PDFDEBUG {
+           (.processToUnicode beg) =
+         } if
+-        2 index /ToUnicode knownoget {
+-          dup type /dicttype eq { dup /File known not } { //true } ifelse {
+-            % We undefine wrong /Length and define /File in stream dictionaries.
+-            % Bug687351.pdf defines /ToUnicode /Identity-H, what is incorrect.
+-            (   **** Warning: Ignoring bad ToUnicode CMap.\n)  pdfformatwarning
+-            pop
++
++        2 index /ToUnicode knownoget
++        {
++            dup type /nametype eq {
++              % This is contrary to the specification but it seems that Acrobat at least will accept
++              % a ToUnicode with a value of Identity-H *and* will use that for search, copy/paste.
++              % We can't pass through a name, so the best we can do is build a GlyphNames2Unicode
++              % map matching that which would have been generated by a full 16-bit Identity CMap
++              %
++              % See bug numbers 701003 and 687351
++              %
++              dup /Identity-H eq 1 index /Identity-V eq or{
++                pop
++                1 index /FontInfo .knownget not {
++                  currentglobal 2 index dup gcheck setglobal
++                  /FontInfo 5 dict dup 5 1 roll .forceput
++                  setglobal
++                } if
++                dup /GlyphNames2Unicode .knownget not {
++                  //true                        % No existing G2U, make one
++                } {
++                  dup wcheck {
++                    //false                     % Existing, writeable G2U, don't make new one
++                  } {
++                    pop //true                          % Existing read only G2U, make new one
++                  } ifelse
++                } ifelse
++                {
++                  currentglobal exch dup gcheck setglobal
++                  dup /GlyphNames2Unicode 100 dict dup 4 1 roll .forceput
++                  3 2 roll setglobal
++                } if                                 % font-res font-dict encoding|null font-info g2u
++
++                0 1 65535{
++                                                        % g2u index
++                  dup dup 256 mod exch 256 idiv         % g2u index lo-byte hi-byte
++                  2 string dup 0 4 -1 roll              % g2u index lo-byte () () 0 hi-byte
++                  put                                   % g2u index lo-byte (x)
++                  dup 1                                 % g2u index lo-byte (x) (x) 1
++                  4 -1 roll put                         % g2u index (x) (x) 1 lo-byte -> dict index (xx)
++                  2 index                               % g2u index (xx) dict
++                  3 1 roll                              % g2u g2u index (xx)
++                  put                                   % g2u
++                } for
++                pop                                     % font-res font-dict encoding|null font-info
++                pop                                     % font-res font-dict encoding|null
++                //false                                 % We built a GlyphNames2Unicode table, don't need to process further
++              }{
++                //true                                  % name is not Identity-V or H, fail by falling through
++              }ifelse
+           } {
+-            /PDFScanRules .getuserparam dup //null eq {
+-              pop //PDFScanRules_null
+-            } {
+-              1 dict dup /PDFScanRules 4 -1 roll put
+-            } ifelse
+-            //PDFScanRules_true setuserparams
+-            PDFfile fileposition
+-            3 -1 roll
+-            count 1 sub
+-            countdictstack
+-            { //false resolvestream
+-              % Following Acrobat we ignore everything outside
+-              %   begincodespacerange .. endcmap.
+-              dup 0 (begincodespacerange) /SubFileDecode filter flushfile
+-              /CIDInit /ProcSet findresource begin
+-              //ToUnicodeCMapReader begin
+-              12 dict begin
+-              /CMapType 2 def
+-              mark exch % emulate 'begincodespacerange'
+-              0 (endcmap) /SubFileDecode filter cvx /begincmap cvx exch 2 .execn
+-              endcmap
+-              userdict /.lastToUnicode currentdict put
+-              end end end
+-            }
++            //true
++          } ifelse                                      % not a name, try as a dictionary (as specified)
+ 
+-            PDFSTOPONERROR {
+-              { exec } 0 get
+-              //false
+-              5 -2 roll
+-              5
++          % If the ToUnicode isn't a name, or the name isn't Identity-V or -H then follow the specification
++          % If its not a dictionary type throw an error, otherwise decode it and build a GlyphNames2Unicode
++          %
++          {
++            dup type /dicttype eq { dup /File known not } { //true } ifelse {
++              % We undefine wrong /Length and define /File in stream dictionaries.
++              % Bug687351.pdf defines /ToUnicode /Identity-H, what is incorrect.
++              (   **** Warning: Ignoring bad ToUnicode CMap.\n)  pdfformatwarning
++              pop
+             } {
+-              { stopped } 0 get
+-              4 2 roll
+-              4
+-            } ifelse
+-            array astore cvx exec
++              /PDFScanRules .getuserparam dup //null eq {
++                pop //PDFScanRules_null
++              } {
++                1 dict dup /PDFScanRules 4 -1 roll put
++              } ifelse
++              //PDFScanRules_true setuserparams
++              PDFfile fileposition
++              3 -1 roll
++              count 1 sub
++              countdictstack
++              { //false resolvestream
++                % Following Acrobat we ignore everything outside
++                %   begincodespacerange .. endcmap.
++                dup 0 (begincodespacerange) /SubFileDecode filter flushfile
++                /CIDInit /ProcSet findresource begin
++                //ToUnicodeCMapReader begin
++                12 dict begin
++                /CMapType 2 def
++                mark exch % emulate 'begincodespacerange'
++                0 (endcmap) /SubFileDecode filter cvx /begincmap cvx exch 2 .execn
++                endcmap
++                userdict /.lastToUnicode currentdict put
++                end end end
++              }
+ 
+-            countdictstack exch sub 0 .max { end } repeat
+-            count exch sub 2 sub 0 .max { exch pop } repeat
+-            3 1 roll                     % Stach the stop flag.
+-            PDFfile exch setfileposition
+-            setuserparams
+-            {
+-              (   **** Warning: Failed to read ToUnicode CMap.\n)  pdfformatwarning
+-            } {
+-              1 index /FontInfo .knownget not {
+-                currentglobal 2 index dup gcheck setglobal
+-                /FontInfo 5 dict dup 5 1 roll .forceput
+-                setglobal
+-              } if
+-              dup /GlyphNames2Unicode .knownget not {
+-                //true                        % No existing G2U, make one
++              PDFSTOPONERROR {
++                { exec } 0 get
++                //false
++                5 -2 roll
++                5
++              } {
++                { stopped } 0 get
++                4 2 roll
++                4
++              } ifelse
++              array astore cvx exec
++
++              countdictstack exch sub 0 .max { end } repeat
++              count exch sub 2 sub 0 .max { exch pop } repeat
++              3 1 roll                     % Stach the stop flag.
++              PDFfile exch setfileposition
++              setuserparams
++              {
++                (   **** Warning: Failed to read ToUnicode CMap.\n)  pdfformatwarning
+               } {
+-                dup wcheck {
+-                  //false                     % Existing, writeable G2U, don't make new one
++                1 index /FontInfo .knownget not {
++                  currentglobal 2 index dup gcheck setglobal
++                  /FontInfo 5 dict dup 5 1 roll .forceput
++                  setglobal
++                } if
++                dup /GlyphNames2Unicode .knownget not {
++                  //true                        % No existing G2U, make one
+                 } {
+-                  pop //true                          % Existing read only G2U, make new one
++                  dup wcheck {
++                    //false                     % Existing, writeable G2U, don't make new one
++                  } {
++                    pop //true                          % Existing read only G2U, make new one
++                  } ifelse
+                 } ifelse
++                {
++                  currentglobal exch dup gcheck setglobal
++                  dup /GlyphNames2Unicode 100 dict dup 4 1 roll .forceput
++                  3 2 roll setglobal
++                } if                                 % font-res font-dict encoding|null font-info g2u
++                exch pop exch                        % font-res font-dict g2u encoding|null
++                userdict /.lastToUnicode get         % font-res font-dict g2u Encoding|null CMap
++                .convert_ToUnicode-into-g2u          % font-res font-dict
++                //null                               % font-res font-dict //null
+               } ifelse
+-              {
+-                currentglobal exch dup gcheck setglobal
+-                dup /GlyphNames2Unicode 100 dict dup 4 1 roll .forceput
+-                3 2 roll setglobal
+-              } if                                 % font-res font-dict encoding|null font-info g2u
+-              exch pop exch                        % font-res font-dict g2u encoding|null
+-              userdict /.lastToUnicode get         % font-res font-dict g2u Encoding|null CMap
+-              .convert_ToUnicode-into-g2u          % font-res font-dict
+-              //null                               % font-res font-dict //null
+             } ifelse
+-          } ifelse
+-        } if
+-        PDFDEBUG {
+-          (.processToUnicode end) =
++          } if
++          PDFDEBUG {
++            (.processToUnicode end) =
++          } if
+         } if
+       } if
+     } stopped
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
new file mode 100644
index 0000000000..6348fff2d1
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
@@ -0,0 +1,236 @@
+From cd1b1cacadac2479e291efe611979bdc1b3bdb19 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Wed, 21 Aug 2019 10:10:51 +0100
+Subject: [PATCH 2/2] PDF interpreter - review .forceput security
+
+Bug #701450 "Safer Mode Bypass by .forceput Exposure in .pdfexectoken"
+
+By abusing the error handler it was possible to get the PDFDEBUG portion
+of .pdfexectoken, which uses .forceput left readable.
+
+Add an executeonly appropriately to make sure that clause isn't readable
+no mstter what.
+
+Review all the uses of .forceput searching for similar cases, add
+executeonly as required to secure those. All cases in the PostScript
+support files seem to be covered already.
+
+CVE: CVE-2019-14817
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ Resource/Init/pdf_base.ps |  2 +-
+ Resource/Init/pdf_draw.ps | 14 +++++++-------
+ Resource/Init/pdf_font.ps | 29 ++++++++++++++++-------------
+ Resource/Init/pdf_main.ps |  6 +++---
+ Resource/Init/pdf_ops.ps  | 11 ++++++-----
+ 5 files changed, 33 insertions(+), 29 deletions(-)
+
+diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
+index 1a218f4..cffde5c 100644
+--- a/Resource/Init/pdf_base.ps
++++ b/Resource/Init/pdf_base.ps
+@@ -157,7 +157,7 @@ currentdict /num-chars-dict .undef
+     {
+       dup ==only () = flush
+     } ifelse % PDFSTEP
+-  } if % PDFDEBUG
++  } executeonly if % PDFDEBUG
+   2 copy .knownget {
+     exch pop exch pop exch pop exec
+   } {
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index e18a7c2..0a3924c 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -501,8 +501,8 @@ end
+       (        Output may be incorrect.\n) pdfformaterror
+       //pdfdict /.gs_warning_issued //true .forceput
+       PDFSTOPONERROR { /gs /undefined signalerror } if
+-    } if
+-  }
++    } executeonly if
++  } executeonly
+   ifelse
+ } bind executeonly def
+ 
+@@ -1142,7 +1142,7 @@ currentdict end readonly def
+           .setglobal
+           pdfformaterror
+         } executeonly ifelse
+-      }
++      } executeonly
+       {
+         currentglobal //pdfdict gcheck .setglobal
+         //pdfdict /.Qqwarning_issued //true .forceput
+@@ -1150,8 +1150,8 @@ currentdict end readonly def
+         pdfformaterror
+       } executeonly ifelse
+       end
+-    } ifelse
+-  } loop
++    } executeonly ifelse
++  } executeonly loop
+   {
+     (\n   **** Error: File has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+     //pdfdict /.Qqwarning_issued .knownget
+@@ -1165,14 +1165,14 @@ currentdict end readonly def
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+-    }
++    } executeonly
+     {
+       currentglobal //pdfdict gcheck .setglobal
+       //pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+     } executeonly ifelse
+-  } if
++  } executeonly if
+   pop
+ 
+   % restore pdfemptycount
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index 2df3303..6a6a5fe 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -638,7 +638,7 @@ currentdict end readonly def
+                   currentglobal 2 index dup gcheck setglobal
+                   /FontInfo 5 dict dup 5 1 roll .forceput
+                   setglobal
+-                } if
++                } executeonly if
+                 dup /GlyphNames2Unicode .knownget not {
+                   //true                        % No existing G2U, make one
+                 } {
+@@ -668,10 +668,12 @@ currentdict end readonly def
+                 pop                                     % font-res font-dict encoding|null font-info
+                 pop                                     % font-res font-dict encoding|null
+                 //false                                 % We built a GlyphNames2Unicode table, don't need to process further
+-              }{
++              } executeonly
++              {
+                 //true                                  % name is not Identity-V or H, fail by falling through
+               }ifelse
+-          } {
++          } executeonly
++          {
+             //true
+           } ifelse                                      % not a name, try as a dictionary (as specified)
+ 
+@@ -759,9 +761,9 @@ currentdict end readonly def
+           PDFDEBUG {
+             (.processToUnicode end) =
+           } if
+-        } if
+-      } if
+-    } stopped
++        } executeonly if
++      } executeonly if
++    } executeonly stopped
+     {
+       .dstackdepth 1 countdictstack 1 sub
+       {pop end} for
+@@ -1291,19 +1293,20 @@ currentdict /eexec_pdf_param_dict .undef
+                 //pdfdict /.Qqwarning_issued //true .forceput
+               } executeonly if
+               Q
+-            } repeat
++            } executeonly repeat
+             Q
+-          } PDFfile fileposition 2 .execn % Keep pdfcount valid.
++          } executeonly PDFfile fileposition 2 .execn % Keep pdfcount valid.
+           PDFfile exch setfileposition
+-        } ifelse
+-      } {
++        } executeonly ifelse
++      } executeonly
++      {
+         % PDF Type 3 fonts don't use .notdef
+         % d1 implementation adjusts the width as needed
+         0 0 0 0 0 0
+         pdfopdict /d1 get exec
+       } ifelse
+       end end
+-    } bdef
++    } executeonly bdef
+     dup currentdict Encoding .processToUnicode
+     currentdict end .completefont exch pop
+ } bind executeonly odef
+@@ -2103,9 +2106,9 @@ currentdict /CMap_read_dict undef
+           (Will continue, but content may be missing.) = flush
+         } ifelse
+       } if
+-    } if
++    } executeonly if
+     /findresource cvx /undefined signalerror
+-  } loop
++  } executeonly loop
+ } bind executeonly odef
+ 
+ /buildCIDType0 {	% <CIDFontType0-font-resource> buildCIDType0 <font>
+diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
+index 5305ea6..a59e63c 100644
+--- a/Resource/Init/pdf_main.ps
++++ b/Resource/Init/pdf_main.ps
+@@ -2749,15 +2749,15 @@ currentdict /PDF2PS_matrix_key undef
+           .setglobal
+           pdfformaterror
+         } executeonly ifelse
+-      }
++      } executeonly
+       {
+         currentglobal //pdfdict gcheck .setglobal
+         //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+-    } if
+-  } if
++    } executeonly if
++  } executeonly if
+   pop
+   count PDFexecstackcount sub { pop } repeat
+   (after exec) VMDEBUG
+diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
+index 285e582..6c1f100 100644
+--- a/Resource/Init/pdf_ops.ps
++++ b/Resource/Init/pdf_ops.ps
+@@ -186,14 +186,14 @@ currentdict /gput_always_allow .undef
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+-    }
++    } executeonly
+     {
+       currentglobal //pdfdict gcheck .setglobal
+       //pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+     } executeonly ifelse
+-  } if
++  } executeonly if
+ } bind executeonly odef
+ 
+ % Save PDF gstate
+@@ -440,11 +440,12 @@ currentdict /gput_always_allow .undef
+   dup type /booleantype eq {
+     .currentSMask type /dicttype eq {
+       .currentSMask /Processed 2 index .forceput
++    } executeonly
++    {
++      .setSMask
++    }ifelse
+   } executeonly
+   {
+-      .setSMask
+-  }ifelse
+-  }{
+   .setSMask
+   }ifelse
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
index fcc9e0099e..349c0c2e8b 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
@@ -25,6 +25,9 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2019-14811-0001.patch \
+                file://CVE-2019-14817-0001.patch \
+                file://CVE-2019-14817-0002.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.20.1


