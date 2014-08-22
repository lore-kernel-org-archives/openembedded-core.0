Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E78A170F48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Aug 2014 01:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310893"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:31 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:41 +0300
Message-Id: <cb186193afd91c3fcf332348f01aa4519b9f70da.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 5/9] jquery.cookie.js: add the Cookie Plugin
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:40 -0000

Add the Cookie Plugin

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 Post/static/js/jquery.cookie.js | 117 ++++++++++++++++++++++++++++++++++++++++
 README                          |   2 +
 2 files changed, 119 insertions(+)
 create mode 100644 Post/static/js/jquery.cookie.js

diff --git a/Post/static/js/jquery.cookie.js b/Post/static/js/jquery.cookie.js
new file mode 100644
index 0000000..9271900
--- /dev/null
+++ b/Post/static/js/jquery.cookie.js
@@ -0,0 +1,117 @@
+/*!
+ * jQuery Cookie Plugin v1.4.0
+ * https://github.com/carhartl/jquery-cookie
+ *
+ * Copyright 2013 Klaus Hartl
+ * Released under the MIT license
+ */
+(function (factory) {
+	if (typeof define === 'function' && define.amd) {
+		// AMD. Register as anonymous module.
+		define(['jquery'], factory);
+	} else {
+		// Browser globals.
+		factory(jQuery);
+	}
+}(function ($) {
+
+	var pluses = /\+/g;
+
+	function encode(s) {
+		return config.raw ? s : encodeURIComponent(s);
+	}
+
+	function decode(s) {
+		return config.raw ? s : decodeURIComponent(s);
+	}
+
+	function stringifyCookieValue(value) {
+		return encode(config.json ? JSON.stringify(value) : String(value));
+	}
+
+	function parseCookieValue(s) {
+		if (s.indexOf('"') === 0) {
+			// This is a quoted cookie as according to RFC2068, unescape...
+			s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
+		}
+
+		try {
+			// Replace server-side written pluses with spaces.
+			// If we can't decode the cookie, ignore it, it's unusable.
+			s = decodeURIComponent(s.replace(pluses, ' '));
+		} catch(e) {
+			return;
+		}
+
+		try {
+			// If we can't parse the cookie, ignore it, it's unusable.
+			return config.json ? JSON.parse(s) : s;
+		} catch(e) {}
+	}
+
+	function read(s, converter) {
+		var value = config.raw ? s : parseCookieValue(s);
+		return $.isFunction(converter) ? converter(value) : value;
+	}
+
+	var config = $.cookie = function (key, value, options) {
+
+		// Write
+		if (value !== undefined && !$.isFunction(value)) {
+			options = $.extend({}, config.defaults, options);
+
+			if (typeof options.expires === 'number') {
+				var days = options.expires, t = options.expires = new Date();
+				t.setDate(t.getDate() + days);
+			}
+
+			return (document.cookie = [
+				encode(key), '=', stringifyCookieValue(value),
+				options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
+				options.path    ? '; path=' + options.path : '',
+				options.domain  ? '; domain=' + options.domain : '',
+				options.secure  ? '; secure' : ''
+			].join(''));
+		}
+
+		// Read
+
+		var result = key ? undefined : {};
+
+		// To prevent the for loop in the first place assign an empty array
+		// in case there are no cookies at all. Also prevents odd result when
+		// calling $.cookie().
+		var cookies = document.cookie ? document.cookie.split('; ') : [];
+
+		for (var i = 0, l = cookies.length; i < l; i++) {
+			var parts = cookies[i].split('=');
+			var name = decode(parts.shift());
+			var cookie = parts.join('=');
+
+			if (key && key === name) {
+				// If second argument (value) is a function it's a converter...
+				result = read(cookie, value);
+				break;
+			}
+
+			// Prevent storing a cookie that we couldn't decode.
+			if (!key && (cookie = read(cookie)) !== undefined) {
+				result[name] = cookie;
+			}
+		}
+
+		return result;
+	};
+
+	config.defaults = {};
+
+	$.removeCookie = function (key, options) {
+		if ($.cookie(key) !== undefined) {
+			// Must not alter options, thus extending a fresh object...
+			$.cookie(key, '', $.extend({}, options, { expires: -1 }));
+			return true;
+		}
+		return false;
+	};
+
+}));
diff --git a/README b/README
index e912103..fcd6e53 100644
--- a/README
+++ b/README
@@ -50,6 +50,8 @@ the Apache License 2.0.
 
 Bundled jQuery is redistributed under the MIT license.
 
+Bundled jquery.cookie.js is redistributed under the MIT license.
+
 Bundled d3.js is redistributed under the BSD License.
 
 Bundled nvd3.js is redistributed under the Apache License 2.0.
-- 
1.9.1


