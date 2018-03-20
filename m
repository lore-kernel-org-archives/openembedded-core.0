Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id C1398789A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:47:26 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2K9lRSa025578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:47:27 +0100
Received: from dev.vm6.ccp.siemens.com (sk1d124c.siemens.sk [163.242.57.217])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w2K9lQSg007041;
	Tue, 20 Mar 2018 10:47:26 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id DBD8295179E;
	Tue, 20 Mar 2018 10:47:25 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:47:15 +0100
Message-Id: <20180320094715.25696-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxml2: 2.9.7 -> 2.9.8
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
X-List-Received-Date: Tue, 20 Mar 2018 09:47:27 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/libxml/libxml2/ansidecl.patch    |  25 ----
 meta/recipes-core/libxml/libxml2/runtest.patch     | 151 +++++++++++----------
 .../libxml/{libxml2_2.9.7.bb => libxml2_2.9.8.bb}  |   5 +-
 3 files changed, 78 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/ansidecl.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.7.bb => libxml2_2.9.8.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/ansidecl.patch b/meta/recipes-core/libxml/libxml2/ansidecl.patch
deleted file mode 100644
index 1085c680b6..0000000000
--- a/meta/recipes-core/libxml/libxml2/ansidecl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Sadly cmake is broken. If it sees this reference and ansidecl is present, it will add a 
-dependency upon it, even if HAVE_ANSIDEC_H is never set.
-
-The easiest solution is to remove these lines, otherwise recipes like libzypp can have a 
-dependency on the ansidecl.h header via cmake. This can lead to odd results if the 
-header is removed (clean binutils) and then the code is recompiled.
-
-RP 2012/7/10
-
-Upstream-Status: Inappropriate [its really a cmake bug]
-
-diff --git a/configure.ac b/configure.ac
-index 0260281..fdb58e9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -484 +483,0 @@ AC_CHECK_HEADERS([time.h])
--AC_CHECK_HEADERS([ansidecl.h])
-diff --git a/include/libxml/xmlversion.h.in b/include/libxml/xmlversion.h.in
-index b173be9..d10f975 100644
---- a/include/libxml/xmlversion.h.in
-+++ b/include/libxml/xmlversion.h.in
-@@ -413,3 +412,0 @@ XMLPUBFUN void XMLCALL xmlCheckVersion(int version);
--#ifdef HAVE_ANSIDECL_H
--#include <ansidecl.h>
--#endif
diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index cb171d5b36..544dc05834 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -6,8 +6,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Upstream-Status: Backport
 
 diff -uNr a/Makefile.am b/Makefile.am
---- a/Makefile.am	2017-08-28 15:01:14.000000000 +0200
-+++ b/Makefile.am	2017-09-05 08:06:05.752287323 +0200
+--- a/Makefile.am	2017-12-02 09:58:10.000000000 +0100
++++ b/Makefile.am	2018-03-20 08:27:34.360505864 +0100
 @@ -202,6 +202,15 @@
  #testOOM_DEPENDENCIES = $(DEPS)
  #testOOM_LDADD= $(LDADDS)
@@ -24,10 +24,9 @@ diff -uNr a/Makefile.am b/Makefile.am
  runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
            testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
  	[ -d test   ] || $(LN_S) $(srcdir)/test   .
-
 diff -uNr a/runsuite.c b/runsuite.c
---- a/runsuite.c	2013-04-12 16:17:11.462823238 +0200
-+++ b/runsuite.c	2013-04-17 14:07:24.352693211 +0200
+--- a/runsuite.c	2016-06-07 12:04:14.000000000 +0200
++++ b/runsuite.c	2018-03-20 08:27:57.478817247 +0100
 @@ -1162,6 +1162,7 @@
  
      if (logfile != NULL)
@@ -37,17 +36,19 @@ diff -uNr a/runsuite.c b/runsuite.c
  }
  #else /* !SCHEMAS */
 diff -uNr a/runtest.c b/runtest.c
---- a/runtest.c	2013-04-16 13:19:15.087997290 +0200
-+++ b/runtest.c	2013-04-17 14:08:29.529949655 +0200
-@@ -4386,6 +4386,7 @@
- 	    err++;
- 	}
+--- a/runtest.c	2017-11-13 22:00:17.000000000 +0100
++++ b/runtest.c	2018-03-20 08:28:50.859047551 +0100
+@@ -4496,7 +4496,8 @@
      }
+ 
+     xmlCharEncCloseFunc(ebcdicHandler);
+-
++    
 +    printf("%s: %s\n", (err == 0) ? "PASS" : "FAIL", tst->desc);
      return(err);
  }
  
-@@ -4455,6 +4456,7 @@
+@@ -4573,6 +4574,7 @@
      xmlCleanupParser();
      xmlMemoryDump();
  
@@ -56,8 +57,8 @@ diff -uNr a/runtest.c b/runtest.c
  }
  
 diff -uNr a/runxmlconf.c b/runxmlconf.c
---- a/runxmlconf.c	2013-04-16 12:53:49.900982990 +0200
-+++ b/runxmlconf.c	2013-04-17 14:09:21.111778104 +0200
+--- a/runxmlconf.c	2016-06-07 12:04:14.000000000 +0200
++++ b/runxmlconf.c	2018-03-20 08:29:17.944862893 +0100
 @@ -595,6 +595,7 @@
  
      if (logfile != NULL)
@@ -67,9 +68,9 @@ diff -uNr a/runxmlconf.c b/runxmlconf.c
  }
  
 diff -uNr a/testapi.c b/testapi.c
---- a/testapi.c	2013-04-12 16:16:57.763417659 +0200
-+++ b/testapi.c	2013-04-17 14:10:28.876924881 +0200
-@@ -1245,49 +1245,91 @@
+--- a/testapi.c	2018-01-25 07:39:15.000000000 +0100
++++ b/testapi.c	2018-03-20 09:08:35.323980145 +0100
+@@ -1246,49 +1246,91 @@
  testlibxml2(void)
  {
      int test_ret = 0;
@@ -200,9 +201,19 @@ diff -uNr a/testapi.c b/testapi.c
      return(test_ret);
  }
  
+diff -uNr a/testdict.c b/testdict.c
+--- a/testdict.c	2016-06-07 12:04:14.000000000 +0200
++++ b/testdict.c	2018-03-20 08:59:16.864275812 +0100
+@@ -440,5 +440,6 @@
+     clean_strings();
+     xmlCleanupParser();
+     xmlMemoryDump();
++    printf("%s: testdict\n\n", (ret == 0) ? "PASS" : "FAIL");
+     return(ret);
+ }
 diff -uNr a/testchar.c b/testchar.c
---- a/testchar.c	2013-04-17 10:50:30.250147418 +0200
-+++ b/testchar.c	2013-04-18 16:11:28.455733800 +0200
+--- a/testchar.c	2016-06-07 12:04:14.000000000 +0200
++++ b/testchar.c	2018-03-20 09:11:20.383573912 +0100
 @@ -23,7 +23,7 @@
  char document1[100] = "<doc>XXXX</doc>";
  char document2[100] = "<doc foo='XXXX'/>";
@@ -222,7 +233,7 @@ diff -uNr a/testchar.c b/testchar.c
  		    "Failed to detect invalid char for Byte 0x%02X: %c\n",
  		        i, i);
 +		return(1);
-+		}
++	    }
  	}
  
  	else if ((i == '<') || (i == '&')) {
@@ -230,8 +241,8 @@ diff -uNr a/testchar.c b/testchar.c
 +	    if ((lastError == 0) || (res != NULL)) {
  	        fprintf(stderr,
  		    "Failed to detect illegal char %c for Byte 0x%02X\n", i, i);
-+			return(1);
-+		}
++		return(1);
++	    }
  	}
  	else if (((i < 0x20) || (i >= 0x80)) &&
  	    (i != 0x9) && (i != 0xA) && (i != 0xD)) {
@@ -239,8 +250,8 @@ diff -uNr a/testchar.c b/testchar.c
 +	    if ((lastError != XML_ERR_INVALID_CHAR) && (res != NULL)) {
  	        fprintf(stderr,
  		    "Failed to detect invalid char for Byte 0x%02X\n", i);
-+			return(1);
-+		}
++		return(1);
++	    }
  	}
  	else if (res == NULL) {
  	    fprintf(stderr,
@@ -250,7 +261,7 @@ diff -uNr a/testchar.c b/testchar.c
  	if (res != NULL)
  	    xmlFreeDoc(res);
      }
-+	return(0);
++    return(0);
  }
  
 -static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
@@ -268,7 +279,7 @@ diff -uNr a/testchar.c b/testchar.c
  		"Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
  			i, j);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -282,7 +293,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
  			i, j);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -296,7 +307,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
  			i, j);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -310,7 +321,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x00\n",
  			i, j);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -318,13 +329,13 @@ diff -uNr a/testchar.c b/testchar.c
  	else if ((lastError != 0) || (res == NULL)) {
  	    fprintf(stderr,
  		"Failed to parse document for Bytes 0x%02X 0x%02X\n", i, j);
-+		return(1);
++	    return(1);
  	}
  	if (res != NULL)
  	    xmlFreeDoc(res);
      }
      }
-+	return(0);
++    return(0);
  }
  
  /**
@@ -438,20 +449,20 @@ diff -uNr a/testchar.c b/testchar.c
 +	    if (lastError != XML_ERR_INVALID_CHAR) {
  	        fprintf(stderr,
  		    "Failed to detect invalid char for Byte 0x%02X\n", i);
-+			return(1);
-+		}
++		return(1);
++	    }
  	} else if (i == 0xD) {
 -	    if ((c != 0xA) || (len != 1))
 +	    if ((c != 0xA) || (len != 1)) {
  		fprintf(stderr, "Failed to convert char for Byte 0x%02X\n", i);
 +		return(1);
-+		}
++	    }
  	} else if ((c != i) || (len != 1)) {
  	    fprintf(stderr, "Failed to parse char for Byte 0x%02X\n", i);
-+		return(1);
++	    return(1);
  	}
      }
-+	return(0);
++    return(0);
  }
  
 -static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
@@ -468,8 +479,8 @@ diff -uNr a/testchar.c b/testchar.c
  		    fprintf(stderr,
  		    "Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
  		            i, j);
-+			return(1);
-+			}
++		    return(1);
++		}
  	    }
  
  	    /*
@@ -482,8 +493,8 @@ diff -uNr a/testchar.c b/testchar.c
  		    fprintf(stderr,
  		"Failed to detect invalid char for Bytes 0x%02X 0x%02X: %d\n",
  		            i, j, c);
-+			return(1);
-+			}
++		    return(1);
++		}
  	    }
  
  	    /*
@@ -496,8 +507,8 @@ diff -uNr a/testchar.c b/testchar.c
  		    fprintf(stderr,
  		"Failed to detect invalid char for Bytes 0x%02X 0x%02X: %d\n",
  		            i, j, c);
-+			return(1);
-+			}
++		    return(1);
++		}
  	    }
  
  	    /*
@@ -510,8 +521,8 @@ diff -uNr a/testchar.c b/testchar.c
  		    fprintf(stderr,
  		"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x00\n",
  		            i, j);
-+			return(1);
-+			}
++		    return(1);
++		}
  	    }
  
              /*
@@ -531,7 +542,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    }
          }
      }
-+	return(0);
++    return(0);
  }
  
 -static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
@@ -549,7 +560,7 @@ diff -uNr a/testchar.c b/testchar.c
  	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n",
  			i, j, K, data[3]);
 +		return(1);
-+		}
++	    }
  	}
  
          /*
@@ -562,7 +573,7 @@ diff -uNr a/testchar.c b/testchar.c
  	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X\n",
  			i, j, K);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -576,7 +587,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X\n",
  			i, j, K);
 +		return(1);
-+		}
++	    }
  	}
  
          /*
@@ -590,7 +601,7 @@ diff -uNr a/testchar.c b/testchar.c
  	"Failed to detect invalid char 0x%04X for Bytes 0x%02X 0x%02X 0x%02X\n",
  			value, i, j, K);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -598,7 +609,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    fprintf(stderr,
  		"Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X\n",
  		    i, j, K);
-+		return(1);
++	    return(1);
  	}
  
  	/*
@@ -606,12 +617,12 @@ diff -uNr a/testchar.c b/testchar.c
  	    fprintf(stderr,
      "Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X: expect %d got %d\n",
  		i, j, data[2], value, c);
-+		return(1);
++	    return(1);
  	}
      }
      }
      }
-+	return(0);
++    return(0);
  }
  
 -static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
@@ -629,7 +640,7 @@ diff -uNr a/testchar.c b/testchar.c
    "Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n",
  			i, j, K, data[3]);
 +		return(1);
-+		}
++	    }
  	}
  
          /*
@@ -643,7 +654,7 @@ diff -uNr a/testchar.c b/testchar.c
  	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n",
  			i, j, K, L);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -657,7 +668,7 @@ diff -uNr a/testchar.c b/testchar.c
  	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n",
  			i, j, K, L);
 +		return(1);
-+		}
++	    }
  	}
  
          /*
@@ -671,7 +682,7 @@ diff -uNr a/testchar.c b/testchar.c
  "Failed to detect invalid char 0x%04X for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n",
  			value, i, j, K, L);
 +		return(1);
-+		}
++	    }
  	}
  
  	/*
@@ -679,7 +690,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    fprintf(stderr,
  		"Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X\n",
  		    i, j, K);
-+		return(1);
++	    return(1);
  	}
  
  	/*
@@ -687,13 +698,13 @@ diff -uNr a/testchar.c b/testchar.c
  	    fprintf(stderr,
      "Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X: expect %d got %d\n",
  		i, j, data[2], value, c);
-+		return(1);
++	    return(1);
  	}
      }
      }
      }
      }
-+	return(0);
++    return(0);
  }
  
  /**
@@ -722,13 +733,13 @@ diff -uNr a/testchar.c b/testchar.c
                                             XML_CHAR_ENCODING_NONE);
      if (buf == NULL) {
          fprintf(stderr, "Failed to allocate input buffer\n");
-+        test_ret = 1;
++	test_ret = 1;
  	goto error;
      }
      input = xmlNewInputStream(ctxt);
      if (input == NULL) {
          xmlFreeParserInputBuffer(buf);
-+        test_ret = 1;
++	test_ret = 1;
  	goto error;
      }
      input->filename = NULL;
@@ -777,20 +788,10 @@ diff -uNr a/testchar.c b/testchar.c
  
      /*
       * Cleanup function for the XML library.
-diff -uNr a/testdict.c b/testdict.c
---- a/testdict.c	2013-04-16 15:08:42.971177193 +0200
-+++ b/testdict.c	2013-04-18 15:59:00.699482439 +0200
-@@ -440,5 +440,6 @@
-     clean_strings();
-     xmlCleanupParser();
-     xmlMemoryDump();
-+    printf("%s: testdict\n\n", (ret == 0) ? "PASS" : "FAIL");
-     return(ret);
- }
 diff -uNr a/testlimits.c b/testlimits.c
---- a/testlimits.c	2013-04-12 16:16:36.180354177 +0200
-+++ b/testlimits.c	2013-04-17 14:03:17.203092987 +0200
-@@ -1630,5 +1630,6 @@
+--- a/testlimits.c	2016-11-07 09:41:40.000000000 +0100
++++ b/testlimits.c	2018-03-20 08:59:38.965581280 +0100
+@@ -1634,5 +1634,6 @@
      xmlCleanupParser();
      xmlMemoryDump();
  
@@ -798,8 +799,8 @@ diff -uNr a/testlimits.c b/testlimits.c
      return(ret);
  }
 diff -uNr a/testrecurse.c b/testrecurse.c
---- a/testrecurse.c	2013-04-16 13:19:49.366536295 +0200
-+++ b/testrecurse.c	2013-04-17 14:06:27.367091622 +0200
+--- a/testrecurse.c	2017-10-26 09:54:40.000000000 +0200
++++ b/testrecurse.c	2018-03-20 09:00:46.781628749 +0100
 @@ -892,6 +892,7 @@
  	    err++;
  	}
diff --git a/meta/recipes-core/libxml/libxml2_2.9.7.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.9.7.bb
rename to meta/recipes-core/libxml/libxml2_2.9.8.bb
index 2fb90a68a8..d55e650911 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.7.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -14,7 +14,6 @@ DEPENDS = "zlib virtual/libiconv"
 SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
            file://libxml-64bit.patch \
-           file://ansidecl.patch \
            file://runtest.patch \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
@@ -23,8 +22,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-execution-of-ptests.patch \
            "
 
-SRC_URI[libtar.md5sum] = "896608641a08b465098a40ddf51cefba"
-SRC_URI[libtar.sha256sum] = "f63c5e7d30362ed28b38bfa1ac6313f9a80230720b7fb6c80575eeab3ff5900c"
+SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
+SRC_URI[libtar.sha256sum] = "0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.11.0


